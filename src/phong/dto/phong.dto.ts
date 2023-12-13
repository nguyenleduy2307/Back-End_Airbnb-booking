import { ApiProperty } from "@nestjs/swagger"
import { IsNotEmpty } from "class-validator"

export class phongDTO {
    @IsNotEmpty({message: 'Mã phòng không được để trống'})
    @ApiProperty()
    ten_phong: string

    @IsNotEmpty({message: 'Số lượng khách không được để trống'})
    @ApiProperty()
    khach: number

    @IsNotEmpty({message: 'Số phòng ngủ không được để trống'})
    @ApiProperty()
    phong_ngu: number

    @IsNotEmpty({message: 'Số lượng giường không được để trống'})
    @ApiProperty()
    giuong: number

    @IsNotEmpty({message: 'Số lượng phòng tắm không được để trống'})
    @ApiProperty()
    phong_tam: number

    @IsNotEmpty({message: 'Mô tả không được để trống'})
    @ApiProperty()
    mo_ta: string

    @IsNotEmpty({message: 'Giá tiền không được để trống'})
    @ApiProperty()
    gia_tien: number

    @IsNotEmpty({message: 'Máy giặt không được để trống'})
    @ApiProperty()
    may_giat: boolean

    @IsNotEmpty({message: 'Bàn là không được để trống'})
    @ApiProperty()
    ban_la: boolean

    @IsNotEmpty({message: 'Tivi không được để trống'})
    @ApiProperty()
    tivi: boolean

    @IsNotEmpty({message: 'Điều hòa không được để trống'})
    @ApiProperty()
    dieu_hoa: boolean

    @IsNotEmpty({message: 'Wifi không được để trống'})
    @ApiProperty()
    wifi: boolean

    @IsNotEmpty({message: 'Bếp không được để trống'})
    @ApiProperty()
    bep: boolean

    @IsNotEmpty({message: 'Đỗ xe không được để trống'})
    @ApiProperty()
    do_xe: boolean

    @IsNotEmpty({message: 'Hồ bơi không được để trống'})
    @ApiProperty()
    ho_boi: boolean

    @IsNotEmpty({message: 'Bàn ủi không được để trống'})
    @ApiProperty()
    ban_ui: boolean

    @IsNotEmpty({message: 'Mã vị trí không được để trống'})
    @ApiProperty()
    ma_vi_tri: number

    @IsNotEmpty({message: 'Hình ảnh không được để trống'})
    @ApiProperty()
    hinh_anh: string
}