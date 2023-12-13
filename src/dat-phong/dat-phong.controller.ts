import {
  Controller,
  Get,
  Param,
  Delete,
  Post,
  Body,
  Put,
  UseGuards,
} from '@nestjs/common';
import { DatPhongService } from './dat-phong.service';
import { ApiBearerAuth, ApiTags } from '@nestjs/swagger';
import { datPhongDTO } from './dto/dat-phong.dto';
import { AuthGuard } from '@nestjs/passport';

@ApiTags('DatPhong')
@Controller('api/dat-phong')
export class DatPhongController {
  constructor(private readonly datPhongService: DatPhongService) {}

  @Get()
  getDatPhong() {
    return this.datPhongService.getDatPhong();
  }

  @Get(':id')
  getDatPhongTheoId(@Param('id') id: string) {
    return this.datPhongService.getDatPhongTheoId(+id);
  }

  @Get('/lay-theo-nguoi-dung/:MaNguoiDung')
  getDatPhongTheoMaNguoiDung(@Param('MaNguoiDung') MaNguoiDung: string) {
    return this.datPhongService.getDatPhongTheoMaNguoiDung(+MaNguoiDung);
  }

  @ApiBearerAuth()
  @UseGuards(AuthGuard('jwt'))
  @Delete(':id')
  deleteDatPhong(@Param('id') id: string) {
    return this.datPhongService.deleteDatPhong(+id);
  }

  @ApiBearerAuth()
  @UseGuards(AuthGuard('jwt'))
  @Post()
  postDatPhong(@Body() body: datPhongDTO) {
    return this.datPhongService.postDatPhong(body);
  }

  @ApiBearerAuth()
  @UseGuards(AuthGuard('jwt'))
  @Put(':id')
  putDatPhong(@Param('id') id: string, @Body() body: datPhongDTO) {
    return this.datPhongService.putDatPhong(+id, body);
  }
}
