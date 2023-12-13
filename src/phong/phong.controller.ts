import {
  Controller,
  Delete,
  Get,
  Query,
  Param,
  Post,
  Body,
  Put,
  UseGuards,
} from '@nestjs/common';
import { PhongService } from './phong.service';
import { ApiBearerAuth, ApiTags } from '@nestjs/swagger';
import { phongDTO } from './dto/phong.dto';
import { AuthGuard } from '@nestjs/passport';

@ApiTags('Phong')
@Controller('api/phong-thue')
export class PhongController {
  constructor(private readonly phongService: PhongService) {}

  @Get()
  getDanhSachPhong() {
    return this.phongService.getDanhSachPhong();
  }

  @Get('/lay-phong-theo-vi-tri')
  getDanhSachPhongTheoViTri(@Query('maViTri') maViTri: string) {
    return this.phongService.getDanhSachPhongTheoViTri(+maViTri);
  }

  @ApiBearerAuth()
  @UseGuards(AuthGuard('jwt'))
  @Delete(':id')
  deletePhong(@Param('id') id: string) {
    return this.phongService.deletePhong(+id);
  }

  @Get(':id')
  getDanhSachPhongTheoId(@Param('id') id: string) {
    return this.phongService.getDanhSachPhongTheoId(+id);
  }

  @ApiBearerAuth()
  @UseGuards(AuthGuard('jwt'))
  @Post()
  postPhong(@Body() body: phongDTO) {
    return this.phongService.postPhong(body);
  }

  @ApiBearerAuth()
  @UseGuards(AuthGuard('jwt'))
  @Put(':id')
  putPhong(@Param('id') id: string, @Body() body: phongDTO) {
    return this.phongService.putPhong(+id, body);
  }
}
