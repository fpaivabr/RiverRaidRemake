extends Resource
##Define um coeficiente de acelaração para partes de uma [PathFollow2D].
class_name CurveAcel

##Marca até que ponto da curva o coeficiente será aplicado, em percentual.
@export_range(0,1) var CurvaProgress

##Multiplica a velocidade do objeto no [path2D].[br]1 mantém a velocidade original[br]2 dobra a velocidade[br]0.1 divide por 10.
@export_range(0.1,10) var CoefienteAceleracao : float = 1
