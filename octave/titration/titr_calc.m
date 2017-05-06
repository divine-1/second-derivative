#!/usr/bin/octave -qf

ph_sig=load('ph.txt');
vol_sig=load('vol.txt');
####plot(vol_sig, ph_sig, 'ro')
####hold on;
#### First Derivative
	#### Midpoint Volume
	for a = 2 : length(vol_sig)-1
		midpnt = "midpnt.txt";
		midp=(vol_sig(a-1)+vol_sig(a))/2;
		fid = fopen(midpnt, 'a');
		fdisp(fid, midp);
		fclose(fid);
	end
	####Delta pH
	for b = 2 : length(ph_sig)-1
		delt_ph = "delt_ph.txt";
		delpH=(ph_sig(b)-ph_sig(b-1));
		fid = fopen(delt_ph, 'a');
		fdisp(fid, delpH);
		fclose(fid);
	end
	####Delta Vol
	for c = 2 : length(vol_sig)-1
		delt_vol = "delt_vol.txt";
		delVol=(vol_sig(c)-vol_sig(c-1));
		fid = fopen(delt_vol, 'a');
		fdisp(fid, delVol);
		fclose(fid);
	end
deltph_sig=load('delt_ph.txt');
deltvo_sig=load('delt_vol.txt');
####plot(deltvo_sig, deltph_sig, 'ro')
#### dpH/dVolume
	for d = 1 : length(deltph_sig)-1
			dp=deltph_sig(d);
		for e = d : length(deltvo_sig)
			dp_dv= dp/deltvo_sig(e);
			dp_dvf = "dp_dv.txt";
			fid = fopen(dp_dvf, 'a');
			fdisp(fid, dp_dv);
			fclose(fid);
		break
		end
	end
#### 1/(dpH/dVolume)
rdp_dv= load('dp_dv.txt');
	for f = 1 : length(rdp_dv)
		rec_dvdp=1/(rdp_dv(f));
		recdp_dv = "recdp_dv.txt";
		fid = fopen(recdp_dv, 'a');
		fdisp(fid, rec_dvdp);
		fclose(fid);
	end

####	Second Derivative
#### Second Derivative: Midpoint Volume
sec_midp=load('midpnt.txt');
	for g = 2 : length(sec_midp)-1
		sec_midpnt = "sec_midpnt.txt";
		sec_Midp=(sec_midp(g)+sec_midp(g-1))/2;
		fid = fopen(sec_midpnt, 'a');
		fdisp(fid, sec_Midp);
		fclose(fid);
	end
### Second Derivative: Delta dpH/dVol
deltadpHdV=load('dp_dv.txt');
	for h = 2 : length(deltadpHdV)-1
		dtdp_dv = "dtdp_dv.txt";
		fid = fopen(dtdp_dv, 'a');
		deltdpv=(deltadpHdV(h)-deltadpHdV(h-1));
		fdisp(fid, deltdpv);
		fclose(fid);
	end
#### Second Derivative: Delta volume
sec_dvol=load('midpnt.txt');
	for i = 2 : length(sec_dvol)-1
		sec_dlvol = "sec_dlvol.txt";
		sec_deltvol=(sec_dvol(i)-sec_dvol(i-1));
		fid = fopen(sec_dlvol, 'a');
		fdisp(fid, sec_deltvol);
		fclose(fid);
	end
#### Second Derivative: (delta dpH/dVol)/ 2nd delta Vol
secdvol=load('sec_dlvol.txt');
secdpH=load('dtdp_dv.txt');
	for j = 1 : length(secdpH)
                        sdp=secdpH(j);
                for k = j : length(secdvol)
                        sdp_dv= sdp/secdvol(k);
                        secdp_dvf = "secdp_dv.txt";
                        fid = fopen(secdp_dvf, 'a');
                        fdisp(fid, sdp_dv);
                        fclose(fid);
                break
                end
        end
sec_derivp=load('secdp_dv.txt');
plot(vol_sig, sec_derivp)
####hold off;
input("Done Yet?[Hit Enter]", "s")
