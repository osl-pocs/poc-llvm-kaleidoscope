project('kaleidoscope', 'cpp', 'c',
  license : 'Apache-2.0 with LLVM exceptions',
  version : '13.0.1',  # llvm version compatibility
  default_options : [
    'warning_level=3',
    'cpp_std=c++20',
  ]
)

PROJECT_PATH = meson.source_root()

cxx = meson.get_compiler('cpp')

deps = [
  dependency('llvm', version : '>=13.0.0'),
]

inc = include_directories('./src')

project_src_files = files(
  PROJECT_PATH + '/src/toy.cpp',
)

clangtidy = find_program('clang-tidy', required: get_option('dev'))
if clangtidy.found()
  run_target(
    'clang-tidy',
    command: [
      PROJECT_PATH + '/scripts/run-clang-tidy.sh',
    ])
endif

exe = executable(
  'kaleidoscope',
  project_src_files,
  dependencies : deps,
  include_directories : inc,
  install : true)
