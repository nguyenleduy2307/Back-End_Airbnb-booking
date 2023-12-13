import { ApiProperty } from '@nestjs/swagger';
import { IsNotEmpty } from 'class-validator';
export class binhLuanDTO {
    @IsNotEmpty({message: 'maPhong không được để trống'})
    @ApiProperty() // hiển thị field lên swagger UI
    ma_phong: number

    @IsNotEmpty({message: 'maNguoiBinhLuan không được để trống'})
    @ApiProperty()
    ma_nguoi_binh_luan: number

    @IsNotEmpty({message: 'ngayBinhLuan không được để trống'})
    @ApiProperty()
    ngay_binh_luan: Date

    @IsNotEmpty({message: 'noiDung không được để trống'})
    @ApiProperty()
    noi_dung: string

    @IsNotEmpty({message: 'saoBinhLuan không được để trống'})
    @ApiProperty()
    sao_binh_luan: number
}