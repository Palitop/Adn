with Ada.Text_IO;
use Ada.Text_IO;

procedure adn is

-- les distintes proteines son: A, T, C, G
--type proteines is (A, T, G, C);

-- una cadena d'adn és una array de n proteines
--type adn is array (1..40) of proteines;

-- la cadena original i la cadena complementaria són adn
--type tadn is record
--    cadena: adn;
--  complementari: adn;
--end record;

-- definim que és el tadn. Tadn són dues cadenes de caràcters
type tadn is record
    cadena: String (1..40);
    complementari: String (1..40);
    longitud: Natural;
end record;

-- declaració de variables
cadena: String (1..40);
longitud: Natural;
adnc: tadn;

-- aquesta funció posa una cadena a un paràmetre de tadn
procedure llegirCadenaMotlle(cadena: in String; longitud: in Natural; adnc: in out tadn) is
    begin
    adnc.cadena := cadena;
    adnc.longitud := longitud;
end llegirCadenaMotlle;

procedure completarADN(adnc: in out tadn) is
    begin
    for i in 1..adnc.longitud loop
        case adnc.cadena(i) is
            when 'A' =>
                adnc.complementari(i):= 'T';
            when 'T' =>
                adnc.complementari(i):= 'A';
            when 'G' =>
                adnc.complementari(i):= 'C';
            when 'C' =>
                adnc.complementari(i):= 'G';
            when others => Put_Line("Caràcter incorrecte" & adnc.cadena(i)'image);
        end case;
    end loop;
end completarADN;

procedure completarADN1(adnc: in out tadn) is
    begin
    for i in 1..40 loop
        if (adnc.cadena(i) = 'A') then
            adnc.complementari(i):= 'T';
        elsif (adnc.cadena(i) = 'T') then
            adnc.complementari(i):= 'A';
        elsif (adnc.cadena(i) = 'C') then
            adnc.complementari(i):= 'G';
        elsif (adnc.cadena(i) = 'G') then
            adnc.complementari(i):= 'C';
        end if;
    end loop;
end completarADN1;

procedure imprimirADN(adnc: in out tadn) is
    f_sortida: File_Type;
    begin
    Create(f_sortida, mode => Out_File, name => "adn.txt");
    put_line(f_sortida, adnc.cadena(1..adnc.longitud));
    put_line(f_sortida, adnc.complementari(1..adnc.longitud));
    Close(f_sortida);
end imprimirADN;

begin
    Put_Line("Escriu una seqüència d'ADN");
    Get_Line (cadena, longitud); -- agafam de teclat la sentència
    llegirCadenaMotlle(cadena, longitud, adnc); -- executam la funció creada abans
    completarADN(adnc);
    imprimirADN(adnc);
end adn;
