import type { ValidationAcceptor, ValidationChecks } from 'langium';
import { CallFonction, DefVariable,  type B0TchAstType, type DefFonction, type Robot } from './generated/ast.js';
import type { B0TchServices } from './b-0-tch-module.js';

/**
 * Register custom validation checks.
 */
export function registerValidationChecks(services: B0TchServices) {
    const registry = services.validation.ValidationRegistry;
    const validator = services.validation.B0TchValidator;
    const checks: ValidationChecks<B0TchAstType> = {
        DefFonction: validator.checkDefFunction,
        DefVariable: validator.checkVoid,
        CallFonction: validator.checkParametersNumber,
        Robot : validator.checkEntry
    };
    registry.register(checks, validator);
}

/**
 * Implementation of custom validations.
 */
export class B0TchValidator {

    checkDefFunction(defFonction: DefFonction, accept: ValidationAcceptor) {
        // Récupérer le parent qui est censé être le `Robot`
        const robot = defFonction.$container as Robot;

        if (!robot) {
            console.warn(`Impossible de trouver le conteneur de la fonction ${defFonction.name}`);
            return;
        }

        // Vérifier les doublons en se basant sur `robot`
        const duplicateCount = robot.bloc.filter(f => f.name === defFonction.name).length;

        if (duplicateCount > 1) {
            accept('warning', `La fonction "${defFonction.name}" est déjà définie.`, { node: defFonction, property: 'name' });
        }
    }
    checkVoid(defVariable: DefVariable, accept: ValidationAcceptor) {
        const typeNode = defVariable.type.$cstNode?.text;
        if (typeNode && typeNode === 'void') {
            accept('error', 'Type should not be void.', {
                node: defVariable,
                property: 'type'
            });
        }
    }

    checkParametersNumber(call: CallFonction, accept: ValidationAcceptor): void {
        const def = call.refFonction;
        if (!def) {
            return;
        }

        const declaredCount = def.ref?.parametres?.length ?? 0;
        const actualCount = call.parametres?.length ?? 0;
        if (declaredCount !== actualCount) {
            accept(
                'error',
                `Wrong number of parameters: expected ${declaredCount}, got ${actualCount}.`,
                { node: call, property: 'parametres' }
            );
        }
    }
    checkEntry(robot : Robot, accept : ValidationAcceptor){
        if (!robot.bloc.find((def) => def.name == "entry")){
            accept('error', 'La fonction entry est requise.', { node: robot });
        }
    }
}
