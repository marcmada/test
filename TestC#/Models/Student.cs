using System;
using System.Collections.Generic;

namespace TestC_.Models;

public partial class Student
{
    public int Id { get; set; }

    public int IdGrupa { get; set; }

    public int IdOras { get; set; }

    public string Nume { get; set; } = null!;

    public string Prenume { get; set; } = null!;

    public virtual Grupa IdGrupaNavigation { get; set; } = null!;

    public virtual Orase IdOrasNavigation { get; set; } = null!;

    public virtual ICollection<Note> Notes { get; } = new List<Note>();
}
