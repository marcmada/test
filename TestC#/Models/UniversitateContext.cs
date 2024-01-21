using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace TestC_.Models;

public partial class UniversitateContext : DbContext
{
    public UniversitateContext()
    {
    }

    public UniversitateContext(DbContextOptions<UniversitateContext> options)
        : base(options)
    {
    }

    public virtual DbSet<Grupa> Grupas { get; set; }

    public virtual DbSet<Materie> Materies { get; set; }

    public virtual DbSet<Note> Notes { get; set; }

    public virtual DbSet<Orase> Orases { get; set; }

    public virtual DbSet<Student> Students { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
        => optionsBuilder.UseSqlServer("Server=DESKTOP-A621KT4\\SQLEXPRESS;Database=Universitate;Trusted_Connection=True;TrustServerCertificate=true;");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.UseCollation("SQL_Romanian_CP1250_CS_AS");

        modelBuilder.Entity<Grupa>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__Grupa__3214EC07280C7F0A");

            entity.ToTable("Grupa");

            entity.Property(e => e.Denumire).HasMaxLength(30);
        });

        modelBuilder.Entity<Materie>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__Materie__3214EC07C4757D63");

            entity.ToTable("Materie");

            entity.Property(e => e.Nume).HasMaxLength(30);
        });

        modelBuilder.Entity<Note>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__Note__3214EC07C037EFB4");

            entity.ToTable("Note");

            entity.Property(e => e.IdMaterie).HasColumnName("Id_Materie");
            entity.Property(e => e.IdStudent).HasColumnName("Id_Student");

            entity.HasOne(d => d.IdMaterieNavigation).WithMany(p => p.Notes)
                .HasForeignKey(d => d.IdMaterie)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("Id_Materie_in_Note_FK");

            entity.HasOne(d => d.IdStudentNavigation).WithMany(p => p.Notes)
                .HasForeignKey(d => d.IdStudent)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("Id_Student_in_Note_FK");
        });

        modelBuilder.Entity<Orase>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__Orase__3214EC07E628DD1E");

            entity.ToTable("Orase");

            entity.Property(e => e.Denumire).HasMaxLength(30);
        });

        modelBuilder.Entity<Student>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__Student__3214EC07D070A2FF");

            entity.ToTable("Student");

            entity.Property(e => e.IdGrupa).HasColumnName("Id_Grupa");
            entity.Property(e => e.IdOras).HasColumnName("Id_Oras");
            entity.Property(e => e.Nume).HasMaxLength(30);
            entity.Property(e => e.Prenume).HasMaxLength(30);

            entity.HasOne(d => d.IdGrupaNavigation).WithMany(p => p.Students)
                .HasForeignKey(d => d.IdGrupa)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("Id_Grupa_in_Student_FK");

            entity.HasOne(d => d.IdOrasNavigation).WithMany(p => p.Students)
                .HasForeignKey(d => d.IdOras)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("Id_Oras_in_Student_FK");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
