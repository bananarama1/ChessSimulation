program Schachsimulator;

	const
	BRETTSIZE = 8;
	
	type
	tRichtung = (Oben,Unten,Rechts,Links,ObenRechts,UntenLinks,ObenLinks,UntenRechts);
	
	tFarbe = (Weiss, Schwarz);
	tArt = (King, Queen, Rook, Horse, Bishop, Pawn);
	tRefFelder = ^tFeld;
	tFeld = record
							Zeile : integer;
							Spalte : integer;
							next : tRefFelder;
						end;
	tRefSchachfigur = ^tSchachfigur;
	tSchachfigur = record
										Farbe : tFarbe;
										Art : tArt;
										Kurz : char;
										Basiswert : integer;
										PositionZ : integer;
										PositionS : integer;
										Wert : integer;
										PossibleMoves : tRefFelder;
										next : tRefSchachfigur;
								 end;
								 
						 
	
								 
	
	
	var
	Figuren : tRefSchachfigur;
	Figur : tRefSchachfigur;
	i,
	j : integer;
	

	function InizialisiereSpielbrett : tRefSchachfigur;
	{inizialisiert alle Figuren. Jeder Eigenschaft wird dabei ein Startwert zugewiesen. 
	* Es Werden erst alle weissen dann alle schwarzen Sonderfiguren inizialisiert,
	* dann weisse dann schwarze Bauern. Alle Figuren sind in einer linearen Liste. Der Funktionswert
	* ist eine Referenz auf diese Liste.}
		var
		ZeigerFigur,
		ZeigerFigurNeu : tRefSchachfigur;
		i : integer;
		
								
	begin
		ZeigerFigur := nil;
		
		begin{inizialisiere Weisse Sonder Figuren}
			new(ZeigerFigurNeu);
			ZeigerFigurNeu^.Farbe := Weiss;
			ZeigerFigurNeu^.Art := Rook;
			ZeigerFigurNeu^.Kurz := 'R';
			ZeigerFigurNeu^.Basiswert := 50;
			ZeigerFigurNeu^.PositionZ := 1;
			ZeigerFigurNeu^.PositionS := 1;
			ZeigerFigurNeu^.Wert := 10;
			ZeigerFigurNeu^.next := ZeigerFigur;
			ZeigerFigur := ZeigerFigurNeu;
			
			new(ZeigerFigurNeu);
			ZeigerFigurNeu^.Farbe := Weiss;
			ZeigerFigurNeu^.Art := Horse;
			ZeigerFigurNeu^.Kurz := 'H';
			ZeigerFigurNeu^.Basiswert := 40;
			ZeigerFigurNeu^.PositionZ := 1;
			ZeigerFigurNeu^.PositionS := 2;
			ZeigerFigurNeu^.Wert := 10;
			ZeigerFigurNeu^.next := ZeigerFigur;
			ZeigerFigur := ZeigerFigurNeu;
		
			new(ZeigerFigurNeu);
			ZeigerFigurNeu^.Farbe := Weiss;
			ZeigerFigurNeu^.Art := Bishop;
			ZeigerFigurNeu^.Kurz := 'B';
			ZeigerFigurNeu^.Basiswert := 30;
			ZeigerFigurNeu^.PositionZ := 1;
			ZeigerFigurNeu^.PositionS := 3;
			ZeigerFigurNeu^.Wert := 10;
			ZeigerFigurNeu^.next := ZeigerFigur;
			ZeigerFigur := ZeigerFigurNeu;
			
			new(ZeigerFigurNeu);
			ZeigerFigurNeu^.Farbe := Weiss;
			ZeigerFigurNeu^.Art := King;
			ZeigerFigurNeu^.Kurz := 'K';
			ZeigerFigurNeu^.Basiswert := 10000;
			ZeigerFigurNeu^.PositionZ := 1;
			ZeigerFigurNeu^.PositionS := 4;
			ZeigerFigurNeu^.Wert := 10;
			ZeigerFigurNeu^.next := ZeigerFigur;
			ZeigerFigur := ZeigerFigurNeu;
		
			new(ZeigerFigurNeu);
			ZeigerFigurNeu^.Farbe := Weiss;
			ZeigerFigurNeu^.Art := Queen;
			ZeigerFigurNeu^.Kurz := 'Q';
			ZeigerFigurNeu^.Basiswert := 100;
			ZeigerFigurNeu^.PositionZ := 1;
			ZeigerFigurNeu^.PositionS := 5;
			ZeigerFigurNeu^.Wert := 10;
			ZeigerFigurNeu^.next := ZeigerFigur;
			ZeigerFigur := ZeigerFigurNeu;
			
			
			new(ZeigerFigurNeu);
			ZeigerFigurNeu^.Farbe := Weiss;
			ZeigerFigurNeu^.Art := Bishop;
			ZeigerFigurNeu^.Kurz := 'B';
			ZeigerFigurNeu^.Basiswert := 30;
			ZeigerFigurNeu^.PositionZ := 1;
			ZeigerFigurNeu^.PositionS := 6;
			ZeigerFigurNeu^.Wert := 10;
			ZeigerFigurNeu^.next := ZeigerFigur;
			ZeigerFigur := ZeigerFigurNeu;
		
			new(ZeigerFigurNeu);
			ZeigerFigurNeu^.Farbe := Weiss;
			ZeigerFigurNeu^.Art := Horse;
			ZeigerFigurNeu^.Kurz := 'H';
			ZeigerFigurNeu^.Basiswert := 40;
			ZeigerFigurNeu^.PositionZ := 1;
			ZeigerFigurNeu^.PositionS := 7;
			ZeigerFigurNeu^.Wert := 10;
			ZeigerFigurNeu^.next := ZeigerFigur;
			ZeigerFigur := ZeigerFigurNeu;
		
			new(ZeigerFigurNeu);
			ZeigerFigurNeu^.Farbe := Weiss;
			ZeigerFigurNeu^.Art := Rook;
			ZeigerFigurNeu^.Kurz := 'R';
			ZeigerFigurNeu^.Basiswert := 50;
			ZeigerFigurNeu^.PositionZ := 1;
			ZeigerFigurNeu^.PositionS := 8;
			ZeigerFigurNeu^.Wert := 10;
			ZeigerFigurNeu^.next := ZeigerFigur;
			ZeigerFigur := ZeigerFigurNeu;
		end;{inizialisiere Weisse Sonder Figuren}
		
		
		begin{inizialisiere Schwarze Sonder Figuren}
			new(ZeigerFigurNeu);
			ZeigerFigurNeu^.Farbe := Schwarz;
			ZeigerFigurNeu^.Art := Rook;
			ZeigerFigurNeu^.Kurz := 'r';
			ZeigerFigurNeu^.Basiswert := 50;
			ZeigerFigurNeu^.PositionZ := 8;
			ZeigerFigurNeu^.PositionS := 1;
			ZeigerFigurNeu^.Wert := 10;
			ZeigerFigurNeu^.next := ZeigerFigur;
			ZeigerFigur := ZeigerFigurNeu;
			
			new(ZeigerFigurNeu);
			ZeigerFigurNeu^.Farbe := Schwarz;
			ZeigerFigurNeu^.Art := Horse;
			ZeigerFigurNeu^.Kurz := 'h';
			ZeigerFigurNeu^.Basiswert := 40;
			ZeigerFigurNeu^.PositionZ := 8;
			ZeigerFigurNeu^.PositionS := 2;
			ZeigerFigurNeu^.Wert := 10;
			ZeigerFigurNeu^.next := ZeigerFigur;
			ZeigerFigur := ZeigerFigurNeu;
		
			new(ZeigerFigurNeu);
			ZeigerFigurNeu^.Farbe := Schwarz;
			ZeigerFigurNeu^.Art := Bishop;
			ZeigerFigurNeu^.Kurz := 'b';
			ZeigerFigurNeu^.Basiswert := 30;
			ZeigerFigurNeu^.PositionZ := 8;
			ZeigerFigurNeu^.PositionS := 3;
			ZeigerFigurNeu^.Wert := 10;
			ZeigerFigurNeu^.next := ZeigerFigur;
			ZeigerFigur := ZeigerFigurNeu;
		
			
			new(ZeigerFigurNeu);
			ZeigerFigurNeu^.Farbe := Schwarz;
			ZeigerFigurNeu^.Art := King;
			ZeigerFigurNeu^.Kurz := 'k';
			ZeigerFigurNeu^.Basiswert := 10000;
			ZeigerFigurNeu^.PositionZ := 8;
			ZeigerFigurNeu^.PositionS := 4;
			ZeigerFigurNeu^.Wert := 10;
			ZeigerFigurNeu^.next := ZeigerFigur;
			ZeigerFigur := ZeigerFigurNeu;
			
			
			new(ZeigerFigurNeu);
			ZeigerFigurNeu^.Farbe := Schwarz;
			ZeigerFigurNeu^.Art := Queen;
			ZeigerFigurNeu^.Kurz := 'q';
			ZeigerFigurNeu^.Basiswert := 100;
			ZeigerFigurNeu^.PositionZ := 8;
			ZeigerFigurNeu^.PositionS := 5;
			ZeigerFigurNeu^.Wert := 10;
			ZeigerFigurNeu^.next := ZeigerFigur;
			ZeigerFigur := ZeigerFigurNeu;
			
			new(ZeigerFigurNeu);
			ZeigerFigurNeu^.Farbe := Schwarz;
			ZeigerFigurNeu^.Art := Bishop;
			ZeigerFigurNeu^.Kurz := 'b';
			ZeigerFigurNeu^.Basiswert := 30;
			ZeigerFigurNeu^.PositionZ := 8;
			ZeigerFigurNeu^.PositionS := 6;
			ZeigerFigurNeu^.Wert := 10;
			ZeigerFigurNeu^.next := ZeigerFigur;
			ZeigerFigur := ZeigerFigurNeu;
		
			new(ZeigerFigurNeu);
			ZeigerFigurNeu^.Farbe := Schwarz;
			ZeigerFigurNeu^.Art := Horse;
			ZeigerFigurNeu^.Kurz := 'h';
			ZeigerFigurNeu^.Basiswert := 40;
			ZeigerFigurNeu^.PositionZ := 8;
			ZeigerFigurNeu^.PositionS := 7;
			ZeigerFigurNeu^.Wert := 10;
			ZeigerFigurNeu^.next := ZeigerFigur;
			ZeigerFigur := ZeigerFigurNeu;
		
			new(ZeigerFigurNeu);
			ZeigerFigurNeu^.Farbe := Schwarz;
			ZeigerFigurNeu^.Art := Rook;
			ZeigerFigurNeu^.Kurz := 'r';
			ZeigerFigurNeu^.Basiswert := 50;
			ZeigerFigurNeu^.PositionZ := 8;
			ZeigerFigurNeu^.PositionS := 8;
			ZeigerFigurNeu^.Wert := 10;
			ZeigerFigurNeu^.next := ZeigerFigur;
			ZeigerFigur := ZeigerFigurNeu;
		end;{inizialisiere Schwarze Sonder Figuren}
		
		for i := 1 to BRETTSIZE do
		{erstelle Reihe Weise Bauern}
		begin	
			new(ZeigerFigurNeu);
			ZeigerFigurNeu^.Farbe := Weiss;
			ZeigerFigurNeu^.Art := Pawn;
			ZeigerFigurNeu^.Kurz := 'P';
			ZeigerFigurNeu^.Basiswert := 10;
			ZeigerFigurNeu^.PositionZ := 2;
			ZeigerFigurNeu^.PositionS := i;
			ZeigerFigurNeu^.Wert := 10;
			ZeigerFigurNeu^.next := ZeigerFigur;
			ZeigerFigur := ZeigerFigurNeu;
		end;
		
		
		for i := 1 to BRETTSIZE do
		{erstelle Reihe schwarzer Bauern}
		begin
			new(ZeigerFigurNeu);
			ZeigerFigurNeu^.Farbe := Schwarz;
			ZeigerFigurNeu^.Art := Pawn;
			ZeigerFigurNeu^.Kurz := 'p';
			ZeigerFigurNeu^.Basiswert := 10;
			ZeigerFigurNeu^.PositionZ := 7;
			ZeigerFigurNeu^.PositionS := i;
			ZeigerFigurNeu^.Wert := 10;
			ZeigerFigurNeu^.next := ZeigerFigur;
			ZeigerFigur := ZeigerFigurNeu;
		end;
		
		InizialisiereSpielbrett := ZeigerFigur;
	
	end;{InizialisiereSpielbrett}
	
	
	function CheckField(
							inRefFiguren : tRefSchachfigur;
							inZeile : integer;
							inSpalte : integer) : tRefSchachfigur;
	{Prüft ob das Feld (inZeile,inSpalte) besetzt ist. Wenn ja liefert es eine Referenz auf die Figur zurück sonst nil.}
	
		var
		ZeigerFigur : tRefSchachfigur;
		gefunden : boolean;
	
	begin
		gefunden := false;
		ZeigerFigur := inRefFiguren;
		while (ZeigerFigur <> nil) and (not gefunden) do
		begin
			if (ZeigerFigur^.PositionZ = inZeile) and (ZeigerFigur^.PositionS = inSpalte) then
				gefunden := true
			else
				ZeigerFigur := ZeigerFigur^.next;
		
		if gefunden then
			CheckField := ZeigerFigur
		else
			CheckField := nil;
			
		
		end;
	
	end;{CheckFiled}
	
	
	procedure ShowChessBoard(inRefFiguren : tRefSchachfigur);
	{Gibt eine Grafik des gegenwärtigen Schachfeldes aus. o steht für leeres Feld kleine Buchstaben für schwarze und große
	* für weise Figuren}
	
		var
		ZeigerFigur : tRefSchachfigur;
		i,
		j : integer;
		
	begin
		ZeigerFigur := inRefFiguren;
		
		for i := 1 to BRETTSIZE do
		begin
			for j := 1 to BRETTSIZE do
			begin
				ZeigerFigur := CheckField(inRefFiguren,i,j);
				if ZeigerFigur <> nil then
					write(ZeigerFigur^.Kurz,' ')
				else
					write('o ');				
			end;
			writeln;
		end;
		
	
	end;{ShowChessBoard}
	
	
	function istWeiss(inRefFigur : tRefSchachfigur) : boolean;
	
	begin
		if inRefFigur^.Farbe = Weiss then
			istWeiss := true
		else
			istWeiss := false;
	
	end;{istWeiss}
	
	function istArt(
						inRefFigur : tRefSchachfigur;
						inArt : tArt) : boolean;
	{Prüft ob Figur mit Referenz inRefFigur die Art inArt hat}
	begin		
		if inRefFigur^.Art = inArt then
			istArt := true
		else
			istArt := false;
	
	end;{istArt}
	
	function sindAndersfarbig(
							inRefFigur1 : tRefSchachfigur;
							inRefFigur2 : tRefSchachfigur) : boolean;
	begin
		if istWeiss(inRefFigur1) = istWeiss(inRefFigur2) then
			sindAndersfarbig := false
		else
			sindAndersfarbig := true;
	end;{sindAndersfarbig}
	
	
	procedure loadPlusDirection(
											inRichtung : tRichtung;
									var outPlusZ : integer;
									var outPlusS : integer);
	{Berechnet die Werte PlusZ und PlusS welche die Schrittrichtung steuern in Abhängigkeit von der eingegebenen Richtung}
	
		var
		plusZ,
		plusS : integer;
		
	begin
		if inRichtung = Oben then
		begin
			plusZ := -1;
			plusS := 0;
		end;
		if inRichtung = Unten then
		begin
			plusZ := 1;
			plusS := 0;
		end;
		if inRichtung = Rechts then
		begin
			plusZ := 0;
			plusS := 1;
		end;
		if inRichtung = Links then
		begin
			plusZ := 0;
			plusS := -1;
		end;
		if inRichtung = ObenRechts then
		begin
			plusZ := -1;
			plusS := 1;
		end;
		if inRichtung = UntenLinks then
		begin
			plusZ := 1;
			plusS := -1;
		end;
		if inRichtung = ObenLinks then
		begin
			plusZ := -1;
			plusS := -1;
		end;
		if inRichtung = UntenRechts then
		begin
			plusZ := 1;
			plusS := 1;
		end;
		
		OutPlusZ := plusZ;
		OutPlusS := plusS;
	
	end;{loadPlusDirection}
	
	
	function FindNextFigur(
							inRichtung : tRichtung;
							inRefFiguren : tRefSchachfigur;
							inRefFigur : tRefSchachfigur) : tRefSchachfigur;
	{Findet eine Referenz auf eine Figur die in der gegebenen Richtung am nächsten zu der 
	* Figur mit Referenz inRefFigur liegt}
		var
		RefNextFigur : tRefSchachfigur;
		Zeile,
		Spalte : integer;
		plusZ,
		plusS : integer;
	
	begin
		RefNextFigur := nil;
		Zeile := inRefFigur^.PositionZ;
		Spalte := inRefFigur^.PositionS;
		
		loadPlusDirection(inRichtung,plusZ,plusS);
	
		Zeile := Zeile + plusZ;
		Spalte := Spalte + plusS;
	
		while (RefNextFigur = nil) and (Zeile <= BRETTSIZE) and (Zeile >= 1) and (Spalte <= BRETTSIZE) and ( Spalte >= 1) do
		begin
			RefNextFigur := CheckField(inRefFiguren,Zeile,Spalte);
			Zeile := Zeile + plusZ;
			Spalte := Spalte + plusS;
		end;
		
		FindNextFigur := RefNextFigur;
	
	end;{FindNextFigure}
	
	procedure CalculateDistance(
									inRefFigur1 : tRefSchachfigur;
									inRefFigur2 : tRefSchachfigur;
							var outDistanceZ : integer;
							var outDistanceS : integer);
	{Prozedur nimmt 2 Referenzen auf Schachfiguren und berechnet aus deren Postionsattributen ihre Distanz zu einander.
	* die Prozedur hat 2 outVariablen die die Distanz in Zeilen und Spalten ist. Die Distanz ist negativ wenn Figur1 rechts bzw unterhalb
	* von Figur2 steht.}
	
		var
		DistanceZ,
		DistanceS : integer;
		
	begin
		DistanceZ := inRefFigur2^.PositionZ - inRefFigur1^.PositionZ;
		DistanceS := inRefFigur2^.PositionS - inRefFigur1^.PositionS;
		
		outDistanceZ := DistanceZ;
		outDistanceS := DistanceS;
	
	end;{CalculateDistance}
	
	
	procedure addMove(
							inRefFigur : tRefSchachfigur;
							inZeile : integer;
							inSpalte : integer);
	{fügt einer Figur ein erreichbares Feld in die Liste PossibleMoves hinzu.}
	
		var
		ZeigerFeld : tRefFelder;
		ZeigerNewFeld : tRefFelder;
	begin
		ZeigerFeld := inRefFigur^.PossibleMoves;
		
		new(ZeigerNewFeld);
		ZeigerNewFeld^.Zeile := inZeile;
		ZeigerNewFeld^.Spalte := inSpalte;
		ZeigerNewFeld^.next := ZeigerFeld;
		inRefFigur^.PossibleMoves := ZeigerNewFeld;
		
	end;{addMove}
	
	
	procedure deleteAllMoves(inRefFigur : tRefSchachfigur);
	{Löscht die Liste alle mögliches Züge der Figur inRefFigur}
	
		var
		ZeigerFeld : tRefFelder;
		
		procedure deleteMove(inZeigerFeld : tRefFelder);
		
		begin
			if inZeigerFeld <> nil then
			begin
				deleteMove(inZeigerFeld^.next);
				dispose(inZeigerFeld);
			end;
		end;{deleteMove}
		
	begin
		ZeigerFeld := inRefFigur^.PossibleMoves;
		deleteMove(ZeigerFeld);
	
	end;{deleteAllMoves}
	
	procedure ShowMoves(inRefFigur : tRefSchachfigur);
	{Schreibt alle Felder in der Liste PossibleMoves aus}
	
		var 
		ZeigerFeld : tRefFelder;
	
	begin
		ZeigerFeld := inRefFigur^.PossibleMoves;
		while ZeigerFeld <> nil do
		begin
			writeln(inRefFigur^.PositionZ,',',inRefFigur^.PositionS,' --> ',ZeigerFeld^.Zeile,',',ZeigerFeld^.Spalte);
			ZeigerFeld := ZeigerFeld^.next;
		end;
	
	
	end;
		
	
	procedure PossibleMovesPawn(
									inRefFiguren : tRefSchachfigur;
									inRefFigur : tRefSchachfigur);
	{Fügt alle möglichen Züge für einen Bauern in die Liste PossibleMpves der Figur 
	* inRefFigur ein}
		var
		RefFigur : tRefSchachfigur;
		RefNearFigur : tRefSchachfigur;
		DistanceZ,
		DistanceS : integer;
		
	begin
		RefFigur := inRefFigur;
		if istWeiss(RefFigur) then
		begin
			RefNearFigur := FindNextFigur(Unten,inRefFiguren,RefFigur);
		{adde gerade moves}
			if RefNearFigur <> nil then
			begin
				CalculateDistance(RefFigur,RefNearFigur,DistanceZ,DistanceS);
				if abs(DistanceZ) > 1 then
				begin
					addMove(RefFigur,RefFigur^.PositionZ + 1,RefFigur^.PositionS);
					if (abs(DistanceZ) > 2) and (RefFigur^.PositionZ = 2) then
						addMove(RefFigur,RefFigur^.PositionZ + 2,RefFigur^.PositionS);
				end;
			end
			else
			{RefNextFigur ist nil}
			begin
				if RefFigur^.PositionZ + 1 <= BRETTSIZE then
				begin
					addMove(RefFigur,RefFigur^.PositionZ + 1,RefFigur^.PositionS);
					if (RefFigur^.PositionZ + 2 <= BRETTSIZE) and (RefFigur^.PositionZ = 2) then
						addMove(RefFigur,RefFigur^.PositionZ + 2,RefFigur^.PositionS);
				end;
			end;
			
			RefNearFigur := FindNextFigur(UntenRechts,inRefFiguren,RefFigur);
		{adde Moves nach unten Rechts}
			if RefNearFigur <> nil then
			begin
				CalculateDistance(RefFigur,RefNearFigur,DistanceZ,DistanceS);
				if (abs(DistanceS) = 1) and (abs(DistanceZ) = 1) and (sindAndersfarbig(RefFigur,RefNearFigur)) then
					addMove(RefFigur,RefFigur^.PositionZ + DistanceZ,RefFigur^.PositionS + DistanceS);
			end;
			
			RefNearFigur := FindNextFigur(UntenLinks,inRefFiguren,RefFigur);
		{adde Moves nach unten Links}
			if RefNearFigur <> nil then
			begin
				CalculateDistance(RefFigur,RefNearFigur,DistanceZ,DistanceS);
				if (abs(DistanceS) = 1) and (abs(DistanceZ) = 1) and (sindAndersfarbig(RefFigur,RefNearFigur)) then
					addMove(RefFigur,RefFigur^.PositionZ + DistanceZ,RefFigur^.PositionS + DistanceS);
			end;
	
		end
		else
		{Bauer ist schwarz}
		begin
			RefNearFigur := FindNextFigur(Oben,inRefFiguren,RefFigur);
		{adde gerade moves}
			if RefNearFigur <> nil then
			begin
				CalculateDistance(RefFigur,RefNearFigur,DistanceZ,DistanceS);
				if abs(DistanceZ) > 1 then
				begin
					addMove(RefFigur,RefFigur^.PositionZ - 1,RefFigur^.PositionS);
					if (abs(DistanceZ) > 2) and (RefFigur^.PositionZ = 7) then
						addMove(RefFigur,RefFigur^.PositionZ - 2,RefFigur^.PositionS);
				end;
			end
			else
			{RefNextFigur ist nil}
			begin
				if RefFigur^.PositionZ - 1 >= 1 then
				begin
					addMove(RefFigur,RefFigur^.PositionZ - 1,RefFigur^.PositionS);
					if (RefFigur^.PositionZ - 2 >= 1) and (RefFigur^.PositionZ = 7) then
						addMove(RefFigur,RefFigur^.PositionZ - 2,RefFigur^.PositionS);
				end;
			end;
			
			RefNearFigur := FindNextFigur(ObenRechts,inRefFiguren,RefFigur);
		{adde Moves nach oben Rechts}
			if RefNearFigur <> nil then
			begin
				CalculateDistance(RefFigur,RefNearFigur,DistanceZ,DistanceS);
				if (abs(DistanceS) = 1) and (abs(DistanceZ) = 1) and (sindAndersfarbig(RefFigur,RefNearFigur)) then
					addMove(RefFigur,RefFigur^.PositionZ + DistanceZ,RefFigur^.PositionS + DistanceS);
			end;
			
			RefNearFigur := FindNextFigur(ObenLinks,inRefFiguren,RefFigur);
		{adde Moves nach unten Links}
			if RefNearFigur <> nil then
			begin
				CalculateDistance(RefFigur,RefNearFigur,DistanceZ,DistanceS);
				if (abs(DistanceS) = 1) and (abs(DistanceZ) = 1) and (sindAndersfarbig(RefFigur,RefNearFigur)) then
					addMove(RefFigur,RefFigur^.PositionZ + DistanceZ,RefFigur^.PositionS + DistanceS);
			end;
	
		end;
		
	end;{PossibleMovesPawn}
	
	
	procedure AddMovesDirection(
								inRichtung : tRichtung;
								inRefFiguren : tRefSchachfigur;
								inRefFigur : tRefSchachfigur);
	{fügt der Figur inRefFigur alle möglichen Felder in Richtung inRichtung bis zur nächsten Figur in die Liste PossibleMoves hinzu}
	
		var
		RefFigur : tRefSchachfigur;
		RefNearFigur : tRefSchachfigur;
		DistanceZ,
		DistanceS,
		plusZ,
		plusS, 
		i,
		j : integer;
		
	begin
		RefFigur := inRefFigur;
		
		loadPlusDirection(inRichtung,plusZ,plusS);
		
		RefNearFigur := FindNextFigur(inRichtung,inRefFiguren,inRefFigur);
		
		
		if RefNearFigur <> nil then
		begin
			CalculateDistance(RefFigur,RefNearFigur,DistanceZ,DistanceS);
			i := RefFigur^.PositionZ + plusZ;
			j := RefFigur^.PositionS + plusS;
			while (i <> RefNearFigur^.PositionZ) or (j <> RefNearFigur^.PositionS) do
			begin
				addMove(RefFigur,i,j);
				i := i + plusZ;
				j := j + plusS;
			end;
			if sindAndersfarbig(RefFigur,RefNearFigur) then
				addMove(RefFigur,RefNearFigur^.PositionZ,RefNearFigur^.PositionS);
		end
		else
		{RefNearFigur ist nil}
		begin
			i := RefFigur^.PositionZ + plusZ;
			j := RefFigur^.PositionS + plusS;
			while (i <= BRETTSIZE) and (j <= BRETTSIZE) and (i >= 1) and (j >= 1) do
			begin
				addMove(RefFigur,i,j);
				i := i + plusZ;
				j := j + plusS;
			end;
		end;
		
	
	end;{AddMovesDirection}
	
	
	procedure PossibleMovesKing(
								inRefFiguren : tRefSchachfigur;
								inRefFigur : tRefSchachfigur);
		
		var
		RefNearFigur : tRefSchachfigur;
		Richtung : tRichtung;
		plusZ,
		plusS : integer;						
	begin
		for Richtung := Oben to UntenRechts do
		begin
			loadPlusDirection(Richtung,plusZ,plusS);
			RefNearFigur := CheckField(inRefFiguren,inRefFigur^.PositionZ + plusZ,inRefFigur^.PositionS + plusS);
			if RefNearFigur <> nil then
			begin
				if sindAndersfarbig(inRefFigur,RefNearFigur) then
					addMove(inRefFigur,RefNearFigur^.PositionZ,RefNearFigur^.PositionS);
			end
			else
			{RefNearFigur ist nil}
			begin
				if (inRefFigur^.PositionZ + plusZ <= BRETTSIZE) and (inRefFigur^.PositionZ + plusZ >= 1) and (inRefFigur^.PositionS + plusS <= BRETTSIZE) and (inRefFigur^.PositionS + plusS >= 1) then
					addMove(inRefFigur, inRefFigur^.PositionZ + plusZ,inRefFigur^.PositionS + plusS);
			end;
		end;
	
	
	end;{PossibleMovesKing}
		
		
	procedure PossibleMovesHorse(
									inRefFiguren : tRefSchachfigur;
									inRefFigur : tRefSchachfigur);
	{berechnet alle möglichen Züge für eine Figur inRefFigur von der Art Horse und Fügt sie in die Liste PossibleMoves ein.}
		
		var 
		RefNearFigur : tRefSchachfigur;
		Richtung : tRichtung;
		plusZ,
		plusS : integer;
		
	begin
		for Richtung := ObenRechts to UntenRechts do
		begin
			loadPlusDirection(Richtung,plusZ,plusS);
			RefNearFigur := CheckField(inRefFiguren,inRefFigur^.PositionZ + 2 * plusZ ,inRefFigur^.PositionS + 1 * plusS);
			if RefNearFigur <> nil then
			begin
				if sindAndersfarbig(inRefFigur,RefNearFigur) then
					addMove(inRefFigur,RefNearFigur^.PositionZ, RefNearFigur^.PositionS);
			end
			else
			{RefNearFigur ist nil}
			begin
				if (inRefFigur^.PositionZ + 2 * plusZ <= BRETTSIZE) and (inRefFigur^.PositionZ + 2 * plusZ >= 1) and (inRefFigur^.PositionS + plusS <= BRETTSIZE) and (inRefFigur^.PositionS + plusS >= 1) then
					addMove(inRefFigur, inRefFigur^.PositionZ + 2 * plusZ, inRefFigur^.PositionS + plusS);
				end;
		end;
		
		{das selbe VErfahren wird durchgeführt aber nun wird plusS mal 2 gerechnet und plusZ mal 1}
		for Richtung := ObenRechts to UntenRechts do
		begin
			loadPlusDirection(Richtung,plusZ,plusS);
			RefNearFigur := CheckField(inRefFiguren,inRefFigur^.PositionZ + 1 * plusZ ,inRefFigur^.PositionS + 2 * plusS);
			if RefNearFigur <> nil then
			begin
				if sindAndersfarbig(inRefFigur,RefNearFigur) then
					addMove(inRefFigur,RefNearFigur^.PositionZ, RefNearFigur^.PositionS);
			end
			else
			{RefNearFigur ist nil}
			begin
				if (inRefFigur^.PositionZ + 1 * plusZ <= BRETTSIZE) and (inRefFigur^.PositionZ + 1 * plusZ >= 1) and (inRefFigur^.PositionS + 2 * plusS <= BRETTSIZE) and (inRefFigur^.PositionS + 2 * plusS >= 1) then
					addMove(inRefFigur, inRefFigur^.PositionZ + 1 * plusZ,inRefFigur^.PositionS + 2 * plusS);
			end;
		end;
	
	end;{CalculateMovesHorse}
		
	
	procedure CalculatePossibleMoves(
								inRefFiguren : tRefSchachfigur;
								inRefFigur : tRefSchachfigur);
	{Berechnet die Möglichen Züge einer Figur mit Referenz inFigur}
		
		var
		Richtung : tRichtung;
		
	begin
		if istArt(inRefFigur,Pawn) then
			PossibleMovesPawn(inRefFiguren,inRefFigur);
		
		if istArt(inRefFigur,Rook) then
			for Richtung := Oben to Links do
				AddMovesDirection(Richtung,inRefFiguren,inRefFigur);
				
		if istArt(inRefFigur,Bishop) then
			for Richtung := ObenRechts to UntenRechts do
				AddMovesDirection(Richtung,inRefFiguren,inRefFigur);
		
		if istArt(inRefFigur,Queen) then
			for Richtung := Oben to UntenRechts do
				AddMovesDirection(Richtung,inRefFiguren,inRefFigur);
				
		if istArt(inRefFigur,King) then
			PossibleMovesKing(inRefFiguren,inRefFigur);
		
		if istArt(inRefFigur,Horse) then
			PossibleMovesHorse(inRefFiguren,inRefFigur);

	end;{CalculatePossibleMoves}
	
	procedure CalculateAllPossibleMoves(inRefFiguren : tRefSchachfigur);
	{berechnet für alle Figuren in der Liste mit Referenz inRefFiguren das Attribut 
	* Possible Moves.}
		
		var 
		RefFigur : tRefSchachfigur;
		
	begin
		RefFigur := inRefFiguren;
		
		while RefFigur <> nil do
		begin
			deleteAllMoves(RefFigur);
			CalculatePossibleMoves(inRefFiguren,RefFigur);
			RefFigur := RefFigur^.next;
		end;
	
	
	end;{CalculateAllPossibleMoves}
	
	
	
		
	
	

	

	
	
begin
	Figuren := InizialisiereSpielbrett;
	
	ShowChessBoard(Figuren);
	
	CalculateAllPossibleMoves(Figuren);
	
	Figur := CheckField(Figuren,8,2);
	
	ShowMoves(Figur);
	
	

	


end.
