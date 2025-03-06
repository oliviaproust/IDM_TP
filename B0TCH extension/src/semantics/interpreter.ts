import { Add, And, CallFonction, Centimeter, Condition, ConstanteBool, ConstanteNum, ConstanteStr, ConsultVariable, DefFonction, DefVariable, Distance, Divide, Equal, Expression, GetDistance, GetTimestamp, Instruction, Inverse, LessThan, Loop, Meter, Metrique, Millimeter, Minus, MoreThan, Movement, Not, OperationBinaire, OperationUnaire, Or, Parametre, ReassignVariable, Robot, Rotation, SetSpeed, SimpleExpression, Times, Type, Variable, Void, Boolean } from "../language/generated/ast.js";
import { B0TchVisitor } from "./b-0-tch-visitor.js";

export class Interpreter implements B0TchVisitor{
    private tableSymbole : Map<String, Object> = new Map();

    visitDefFonction(node: DefFonction) {
        this.tableSymbole.set(node.name, node)
        for (let instruction of node.bloc){
            this.visitInstruction(instruction);
        }
        throw new Error("Method not implemented.");
    }
    visitInstruction(node: Instruction) {
        throw new Error("Method not implemented.");
    }
    visitCondition(node: Condition) {
        throw new Error("Method not implemented.");
    }
    visitExpression(node: Expression) {
        throw new Error("Method not implemented.");
    }
    visitCallFonction(node: CallFonction) {
        throw new Error("Method not implemented.");
    }
    visitConstanteBool(node: ConstanteBool) {
        throw new Error("Method not implemented.");
    }
    visitConstanteNum(node: ConstanteNum) {
        throw new Error("Method not implemented.");
    }
    visitConstanteStr(node: ConstanteStr) {
        throw new Error("Method not implemented.");
    }
    visitConsultVariable(node: ConsultVariable) {
        throw new Error("Method not implemented.");
    }
    visitDistance(node: Distance) {
        throw new Error("Method not implemented.");
    }
    visitGetDistance(node: GetDistance) {
        throw new Error("Method not implemented.");
    }
    visitGetTimestamp(node: GetTimestamp) {
        throw new Error("Method not implemented.");
    }
    visitMovement(node: Movement) {
        throw new Error("Method not implemented.");
    }
    visitOperationBinaire(node: OperationBinaire) {
        throw new Error("Method not implemented.");
    }
    visitAdd(node: Add) {
        throw new Error("Method not implemented.");
    }
    visitAnd(node: And) {
        throw new Error("Method not implemented.");
    }
    visitDivide(node: Divide) {
        throw new Error("Method not implemented.");
    }
    visitEqual(node: Equal) {
        throw new Error("Method not implemented.");
    }
    visitLessThan(node: LessThan) {
        throw new Error("Method not implemented.");
    }
    visitMinus(node: Minus) {
        throw new Error("Method not implemented.");
    }
    visitMoreThan(node: MoreThan) {
        throw new Error("Method not implemented.");
    }
    visitOr(node: Or) {
        throw new Error("Method not implemented.");
    }
    visitTimes(node: Times) {
        throw new Error("Method not implemented.");
    }
    visitOperationUnaire(node: OperationUnaire) {
        throw new Error("Method not implemented.");
    }
    visitInverse(node: Inverse) {
        throw new Error("Method not implemented.");
    }
    visitNot(node: Not) {
        throw new Error("Method not implemented.");
    }
    visitSimpleExpression(node: SimpleExpression) {
        throw new Error("Method not implemented.");
    }
    visitLoop(node: Loop) {
        throw new Error("Method not implemented.");
    }
    visitReassignVariable(node: ReassignVariable) {
        throw new Error("Method not implemented.");
    }
    visitRotation(node: Rotation) {
        throw new Error("Method not implemented.");
    }
    visitSetSpeed(node: SetSpeed) {
        throw new Error("Method not implemented.");
    }
    visitVariable(node: Variable) {
        throw new Error("Method not implemented.");
    }
    visitDefVariable(node: DefVariable) {
        throw new Error("Method not implemented.");
    }
    visitParametre(node: Parametre) {
        throw new Error("Method not implemented.");
    }
    visitMetrique(node: Metrique) {
        throw new Error("Method not implemented.");
    }
    visitCentimeter(node: Centimeter) {
        throw new Error("Method not implemented.");
    }
    visitMeter(node: Meter) {
        throw new Error("Method not implemented.");
    }
    visitMillimeter(node: Millimeter) {
        throw new Error("Method not implemented.");
    }
    visitRobot(node: Robot) {
        throw new Error("Method not implemented.");
    }
    visitType(node: Type) {
        throw new Error("Method not implemented.");
    }
    visitBoolean(node: Boolean) {
        throw new Error("Method not implemented.");
    }
    visitVoid(node: Void) {
        throw new Error("Method not implemented.");
    }

}