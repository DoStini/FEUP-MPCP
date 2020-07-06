################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
S_SRCS += \
../src/VF5.s \
../src/checkrange_up201904721_1MIEIC03.s \
../src/countcommon_up201904721_1MIEIC03.s.s \
../src/estep_up201904721_1MIEIC03.s \
../src/estudo.s \
../src/ex1.s \
../src/ex2.s \
../src/ex3.s \
../src/ex4.s \
../src/ex5.s \
../src/ex7.s \
../src/freqchars_up201904721_1MIEIC03.s \
../src/simd.s \
../src/stack.s \
../src/xAinAB.s 

C_SRCS += \
../src/Base.c 

OBJS += \
./src/Base.o \
./src/VF5.o \
./src/checkrange_up201904721_1MIEIC03.o \
./src/countcommon_up201904721_1MIEIC03.s.o \
./src/estep_up201904721_1MIEIC03.o \
./src/estudo.o \
./src/ex1.o \
./src/ex2.o \
./src/ex3.o \
./src/ex4.o \
./src/ex5.o \
./src/ex7.o \
./src/freqchars_up201904721_1MIEIC03.o \
./src/simd.o \
./src/stack.o \
./src/xAinAB.o 

C_DEPS += \
./src/Base.d 


# Each subdirectory must supply rules for building sources it contributes
src/%.o: ../src/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler 7.5.0 [aarch64-elf]'
	aarch64-elf-gcc -O0 -g -Wall -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

src/%.o: ../src/%.s
	@echo 'Building file: $<'
	@echo 'Invoking: GCC Assembler 7.5.0 [aarch64-elf]'
	aarch64-elf-as -g -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


