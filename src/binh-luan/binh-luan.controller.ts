import {
  Controller,
  Get,
  Post,
  Body,
  Param,
  UseGuards,
  Delete,
  Put,
} from '@nestjs/common';

import { BinhLuanService } from './binh-luan.service';
import { ApiBearerAuth, ApiTags } from '@nestjs/swagger';
import { AuthGuard } from '@nestjs/passport';
import { binhLuanDTO } from './dto/binh-luan.dto';

@ApiTags('BinhLuan')
@Controller('api/binh-luan')
export class BinhLuanController {
  constructor(private readonly binhLuanService: BinhLuanService) {}

  @Get()
  getBinhLuan() {
    return this.binhLuanService.getBinhLuan();
  }

  @ApiBearerAuth()
  @UseGuards(AuthGuard('jwt'))
  @Post()
  postBinhLuan(@Body() body: binhLuanDTO): any {
    return this.binhLuanService.postBinhLuan(body);
  }

  @Get('/lay-binh-luan-theo-phong/:MaPhong')
  getBinhLuanTheoMaPhong(@Param('MaPhong') MaPhong: string) {
    return this.binhLuanService.getBinhLuanTheoMaPhong(+MaPhong);
  }

  @ApiBearerAuth()
  @UseGuards(AuthGuard('jwt'))
  @Delete(':id')
  deleteBinhLuan(@Param('id') id: string) {
    return this.binhLuanService.deleteBinhLuan(+id);
  }

  @ApiBearerAuth()
  @UseGuards(AuthGuard('jwt'))
  @Put(':id')
  putBinhLuan(@Param('id') id: string, @Body() body: binhLuanDTO) {
    return this.binhLuanService.putBinhLuan(+id, body);
  }
}
