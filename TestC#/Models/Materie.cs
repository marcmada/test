namespace TestC_.Models;

public partial class Materie
{
    public int Id { get; set; }

    public string Nume { get; set; } = null!;

    public virtual ICollection<Note> Notes { get; } = new List<Note>();
}
