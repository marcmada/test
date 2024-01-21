using System;
using System.Collections.Generic;

namespace TestC_.Models;

public partial class Note
{
    public int Id { get; set; }

    public int IdStudent { get; set; }

    public int IdMaterie { get; set; }

    public float Nota { get; set; }

    public virtual Materie IdMaterieNavigation { get; set; } = null!;

    public virtual Student IdStudentNavigation { get; set; } = null!;
}
