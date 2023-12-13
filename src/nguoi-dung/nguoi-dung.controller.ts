import {
  Controller,
  Get,
  Param,
  Query,
  Delete,
  Post,
  Body,
  Put,
  UseGuards,
} from '@nestjs/common';
import { NguoiDungService } from './nguoi-dung.service';
import { ApiBearerAuth, ApiTags } from '@nestjs/swagger';
import { nguoiDungDTO } from './dto/nguoi-dung.dto';
import { AuthGuard } from '@nestjs/passport';

@ApiTags('NguoiDung')
@Controller('api/users')
export class NguoiDungController {
  constructor(private readonly nguoiDungService: NguoiDungService) {}

  @Get()
  getNguoiDung() {
    return this.nguoiDungService.getNguoiDung();
  }

  @Get(':id')
  getNguoiDungTheoId(@Param('id') id: string) {
    return this.nguoiDungService.getNguoiDungTheoId(+id);
  }

  @Get('/search/:TenNguoiDung')
  getNguoiDungTheoTen(@Param('TenNguoiDung') TenNguoiDung: string) {
    return this.nguoiDungService.getNguoiDungTheoTen(TenNguoiDung);
  }

  @ApiBearerAuth()
  @UseGuards(AuthGuard('jwt'))
  @Delete()
  deleteNguoiDung(@Query('id') id: string) {
    return this.nguoiDungService.deleteNguoiDung(+id);
  }

  @ApiBearerAuth()
  @UseGuards(AuthGuard('jwt'))
  @Post()
  postNguoiDung(@Body() body: nguoiDungDTO) {
    return this.nguoiDungService.postNguoiDung(body);
  }

  @ApiBearerAuth()
  @UseGuards(AuthGuard('jwt'))
  @Put(':id')
  putNguoiDung(@Param('id') id: string, @Body() body: nguoiDungDTO) {
    return this.nguoiDungService.putNguoiDung(+id, body);
  }
}
