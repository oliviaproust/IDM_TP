import type { ValidationAcceptor, ValidationChecks } from 'langium';
import type { B0TchAstType, Person } from './generated/ast.js';
import type { B0TchServices } from './b-0-tch-module.js';

/**
 * Register custom validation checks.
 */
export function registerValidationChecks(services: B0TchServices) {
    const registry = services.validation.ValidationRegistry;
    const validator = services.validation.B0TchValidator;
    const checks: ValidationChecks<B0TchAstType> = {
        Person: validator.checkPersonStartsWithCapital
    };
    registry.register(checks, validator);
}

/**
 * Implementation of custom validations.
 */
export class B0TchValidator {

    checkPersonStartsWithCapital(person: Person, accept: ValidationAcceptor): void {
        if (person.name) {
            const firstChar = person.name.substring(0, 1);
            if (firstChar.toUpperCase() !== firstChar) {
                accept('warning', 'Person name should start with a capital.', { node: person, property: 'name' });
            }
        }
    }

}
