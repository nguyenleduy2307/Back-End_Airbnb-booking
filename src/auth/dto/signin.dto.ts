import { ApiProperty } from "@nestjs/swagger"
import { IsEmail, IsNotEmpty } from "class-validator"

export class signinDTO {
    @IsEmail({}, {message: 'Email không đúng định dạng'})  // validation field
    @ApiProperty() // hiển thị field lên swagger UI
    email: string

    @IsNotEmpty({message: 'pass_word không được để trống'})
    @ApiProperty()
    password: string
}