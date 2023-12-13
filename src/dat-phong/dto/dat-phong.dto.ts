import { ApiProperty } from "@nestjs/swagger"
import { IsNotEmpty } from "class-validator"

export class datPhongDTO {
    @IsNotEmpty({message: 'Mã phòng không được để trống'})
    @ApiProperty()
    ma_phong: number

    @IsNotEmpty({message: 'Ngày đến không được để trống'})
    @ApiProperty()
    ngay_den: Date

    @IsNotEmpty({message: 'Ngày đi không được để trống'})
    @ApiProperty()
    ngay_di: Date

    @IsNotEmpty({message: 'Số lượng khách không được để trống'})
    @ApiProperty()
    so_luong_khach: number

    @IsNotEmpty({message: 'Mã người dùng không được để trống'})
    @ApiProperty()
    ma_nguoi_dung: number
}