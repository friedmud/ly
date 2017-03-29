[Mesh]
  type = GeneratedMesh
  dim = 2
  nx = 20
  ny = 30
[]

[Variables]
  [./u]
  [../]
[]

[Kernels]
  [./diff]
    type = LYDiff
    variable = u
  [../]
  [./force]
    type = LYForce
    variable = u
  [../]
[]

[BCs]
  [./thebc]
    type = NeumannBC
    variable = u
    boundary = '0 1 2 3'
    value = 0.2
  [../]
[]

[Materials]
  [./mat]
    type = LYMaterial
    block = 0
    ly_u = u
    kappa = 1
  [../]
[]

[Executioner]
  type = Steady
  petsc_options_iname = '-pc_type -pc_hypre_type'
  petsc_options_value = 'hypre boomeramg'
[]

[Outputs]
  exodus = true
[]

