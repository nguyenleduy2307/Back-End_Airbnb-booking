import { ApiProperty } from "@nestjs/swagger"
import { IsEmail, IsNotEmpty } from "class-validator"

export class nguoiDungDTO {
    @IsEmail({}, {message: 'Email không đúng định dạng'})  // validation field
    @ApiProperty() // hiển thị field lên swagger UI
    email: string

    @IsNotEmpty({message: 'pass_word không được để trống'})
    @ApiProperty()
    password: string

    @IsNotEmpty({message: 'name không được để trống'})
    @ApiProperty()
    name: string

    @IsNotEmpty({message: 'phone không được để trống'})
    @ApiProperty()
    phone: string

    @IsNotEmpty({message: 'birthday không được để trống'})
    @ApiProperty()
    birthday: string

    @IsNotEmpty({message: 'avatar không được để trống'})
    @ApiProperty()
    avatar: string

    @IsNotEmpty({message: 'gender không được để trống'})
    @ApiProperty()
    gender: boolean

    @IsNotEmpty({message: 'role không được để trống'})
    @ApiProperty()
    role: string
}