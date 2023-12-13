import { ApiProperty } from '@nestjs/swagger';
import { IsNotEmpty } from 'class-validator';

export class viTriDTO {
    @IsNotEmpty({message: 'Tên vị trí không được để trống'})
    @ApiProperty()
    ten_vi_tri: string

    @IsNotEmpty({message: 'Tỉnh thành không được để trống'})
    @ApiProperty()
    tinh_thanh: string

    @IsNotEmpty({message: 'Quốc gia không được để trống'})
    @ApiProperty()
    quoc_gia: string

    @IsNotEmpty({message: 'Hình ảnh không được để trống'})
    @ApiProperty()
    hinh_anh: string
}