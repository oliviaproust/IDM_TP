import 'XMLType-types'

type Direction = Direction_Forward | Direction_Backward | Direction_Left | Direction_Right;
type Direction_Forward = 'Forward';
type Direction_Backward = 'Backward';
type Direction_Left = 'Left';
type Direction_Right = 'Right';

type SensRotation = SensRotation_Clock | SensRotation_CounterClock;
type SensRotation_Clock = 'Clock';
type SensRotation_CounterClock = 'CounterClock';

interface Add extends OperationBinaire {
}

interface OperationBinaire extends Expression {
	x: Expression
	y: Expression
}

interface Expression extends Instruction {
}

interface Instruction {
}

interface Type {
}

interface Metrique {
}

interface ConsultVariable extends Expression {
	defvariable: @DefVariable
}

interface DefVariable extends Instruction {
	libelle?: string
	^type: Type
	valeur: Expression
}

interface Constante extends Expression {
	value?: Double
}

interface CallFonction extends Expression {
	libelle?: String
	refFonction: @DefFonction
}

interface DefFonction extends Instruction {
	bloc: Instruction[]
	libelle?: String
}

interface Minus extends OperationBinaire {
}

interface Times extends OperationBinaire {
}

interface Divide extends OperationBinaire {
}

interface And extends OperationBinaire {
}

interface Or extends OperationBinaire {
}

interface Inverse extends OperationUnaire {
}

interface OperationUnaire extends Expression {
	x: Expression
}

interface Not extends OperationUnaire {
}

interface MoreThan extends OperationBinaire {
}

interface LessThan extends OperationBinaire {
}

interface Equal extends OperationBinaire {
}

interface Number extends Type {
}

interface Boolean extends Type {
}

interface Void extends Type {
}

interface Movement extends Instruction {
	direction?: Direction
	distance?: Double
	metrique: Metrique
}

interface Rotation extends Instruction {
	sens?: SensRotation
	degre?: Double
}

interface Loop extends Instruction {
	bloc: Instruction[]
	condition: Expression
}

interface Condition extends Instruction {
	bloc: Instruction[]
	condition: Expression
}

interface SetSpeed extends Instruction {
	vitesse?: number
	metrique: Metrique
}

interface getTimestamp extends Instruction {
}

interface Centimeter extends Metrique {
}

interface Meter extends Metrique {
}

interface Millimeter extends Metrique {
}

