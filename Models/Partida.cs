public class Partida
{
    public int idPartida { get; set; }
    public int idUsuario1 { get; set; }
    public int idUsuario2 { get; set; }
    public int idProgreso1 { get; set; }
    public int idProgreso2 { get; set; }
    public int Turno { get; set; }

    public Partida() { }

    public Partida(int idusuario1, int idusuario2, int idprogreso1, int idprogreso2, int turno)
    {
        idUsuario1 = idusuario1;
        idUsuario2 = idusuario2;
        idProgreso1 = idprogreso1;
        idProgreso2 = idprogreso2;
        Turno = turno;
    }
}