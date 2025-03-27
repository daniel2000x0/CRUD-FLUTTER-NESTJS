import { Injectable, NotFoundException } from '@nestjs/common';
import { CreateProductDto } from './dto/create-product.dto';
import { UpdateProductDto } from './dto/update-product.dto';
import { InjectRepository } from '@nestjs/typeorm';
import { Product } from './entities/product.entity';
import { Repository } from 'typeorm';

@Injectable()
export class ProductsService {
  constructor(
    @InjectRepository(Product)
    private readonly productRepository: Repository<Product>) {
  }

  async create(createCityDto: CreateProductDto) {
    const city = this.productRepository.create(createCityDto);

    return await this.productRepository.save(city);
  }

  async findAll() {
    return await this.productRepository.find();
  }

  async findOne(id: number) {
    return await this.productRepository.findOne({ where: { id } });
  }

  async update(id: number, updateCityDto: UpdateProductDto) {
    const city = await this.findOne(id);
    if (!city) {
      throw new NotFoundException();
    }

    Object.assign(city, updateCityDto);

    return await this.productRepository.save(city);
  }

  async remove(id: number) {
    const city = await this.findOne(id);
    if (!city) {
      throw new NotFoundException();
    }

    return await this.productRepository.remove(city);
  }
}
