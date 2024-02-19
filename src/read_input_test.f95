program read_input_test

    use parameters

    implicit none

    read(*,*) input_file

    open(unit = 3, file = input_file)
    read(3, nml = input_parameters)
    write(*, nml = input_parameters)
    
end program read_input_test