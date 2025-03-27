import { IsDecimal, IsInt, IsNotEmpty, IsOptional, IsString } from 'class-validator';

export class CreateProductDto {

  @IsNotEmpty() // Ensure that 'code' is not empty
  @IsString() // Validate that 'code' is a string
  readonly code: string;

  @IsNotEmpty() // Ensure that 'description' is not empty
  @IsString() // Validate that 'description' is a string
  readonly description: string;

  @IsOptional() // This field is optional
  @IsDecimal() // Validate that 'price' is a decimal number
  readonly price?: number;

  @IsOptional() // This field is optional
  @IsInt() // Validate that 'quantity' is an integer
  readonly quantity?: number;
}
