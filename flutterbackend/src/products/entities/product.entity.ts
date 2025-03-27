import { Column, Double, Entity, PrimaryGeneratedColumn } from "typeorm";



@Entity({ name: 'product' })
export class Product {


    @PrimaryGeneratedColumn()
  id: number;

  @Column({ unique: true })
  code: string;

  @Column({ type: 'text' }) // Hacerlo obligatorio, ya no nullable
  description: string;

  @Column({ type: 'decimal', nullable: true, default: 0.0 })// Permitir null en precio
  price: number;

  @Column({ nullable: true, default: 0 }) // Permitir null en cantidad
  quantity: number;

}
