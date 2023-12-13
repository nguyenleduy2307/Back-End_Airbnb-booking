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
import { ViTriService } from './vi-tri.service';
import { ApiBearerAuth, ApiTags } from '@nestjs/swagger';
import { viTriDTO } from './dto/vi-tri.dto';
import { AuthGuard } from '@nestjs/passport';

@ApiTags('ViTri')
@Controller('api/vi-tri')
export class ViTriController {
  constructor(private readonly viTriService: ViTriService) {}
  @Get()
  getViTri() {
    return this.viTriService.getViTri();
  }

  @Get(':id')
  getViTriTheoId(@Param('id') id: string) {
    return this.viTriService.getViTriTheoId(+id);
  }

  @ApiBearerAuth()
  @UseGuards(AuthGuard('jwt'))
  @Delete(':id')
  deleteViTri(@Param('id') id: string) {
    return this.viTriService.deleteViTri(+id);
  }

  @ApiBearerAuth()
  @UseGuards(AuthGuard('jwt'))
  @Post()
  postViTri(@Body() body: viTriDTO) {
    return this.viTriService.postViTri(body);
  }

  @ApiBearerAuth()
  @UseGuards(AuthGuard('jwt'))
  @Put(':id')
  putViTri(@Param('id') id: string, @Body() body: viTriDTO) {
    return this.viTriService.putViTri(+id, body);
  }
}
