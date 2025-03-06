import type { ValidationAcceptor, ValidationChecks } from 'langium';
import type { B0TchAstType, DefFonction, Robot } from './generated/ast.js';
import type { B0TchServices } from './b-0-tch-module.js';

/**
 * Register custom validation checks.
 */
export function registerValidationChecks(services: B0TchServices) {
    const registry = services.validation.ValidationRegistry;
    const validator = services.validation.B0TchValidator;
    const checks: ValidationChecks<B0TchAstType> = {
        DefFonction: validator.checkDefFunction
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
}
