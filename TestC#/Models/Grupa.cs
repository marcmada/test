using System;
using System.Collections.Generic;

namespace TestC_.Models;

public partial class Grupa
{
    public int Id { get; set; }

    public string Denumire { get; set; } = null!;

    public virtual ICollection<Student> Students { get; } = new List<Student>();
}
