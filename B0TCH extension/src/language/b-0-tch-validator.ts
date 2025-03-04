import type { ValidationChecks } from 'langium';
import type { B0TchAstType } from './generated/ast.js';
import type { B0TchServices } from './b-0-tch-module.js';

/**
 * Register custom validation checks.
 */
export function registerValidationChecks(services: B0TchServices) {
    const registry = services.validation.ValidationRegistry;
    const validator = services.validation.B0TchValidator;
    const checks: ValidationChecks<B0TchAstType> = {

    };
    registry.register(checks, validator);
}

/**
 * Implementation of custom validations.
 */
export class B0TchValidator {



}
