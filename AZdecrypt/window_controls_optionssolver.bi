case button_optionssolver_normalize
	if msg.message=wm_lbuttondown then
		if task_active<>"none" then stop_current_task
		if len(solver_file_name_ngrams)>0 then
			sleep 100
			if task_active="none" then
				sleep 10
				normalize_ngramfactor
			else ui_editbox_settext(output_text,"Error: "+task_active+ " still active")
			end if
		else ui_editbox_settext(output_text,"Error: no n-grams loaded")
		end if
	end if

case button_optionssolver_change
	if msg.message=wm_lbuttondown then
		if ui_editbox_gettext(editbox_optionssolver_a1)<>"" then
			if task_active="none" then
				i=ui_listbox_getcursel(list_optionssolver)
				s=ui_listbox_gettext(list_optionssolver,i)
				s=left(s,instr(s,":")-1)
				dim as integer change=0
				dim as double d=-1
				dim as string dd=ui_editbox_gettext(editbox_optionssolver_a1)
				if lcase(chr(asc(dd,1)))="n" then d=0
				if lcase(chr(asc(dd,1)))="y" then d=1
				if d=-1 then d=val(ui_editbox_gettext(editbox_optionssolver_a1))
				select case s
					case "(General) CPU threads"
						if d>=1 andalso d<=threadsmax then
							change=1
							solvesub_cputhreads=d
							ui_listbox_replacestring(list_optionssolver,i,s+": "+str(solvesub_cputhreads))
						else ui_editbox_settext(output_text,"Error: solver options (A1)")
						end if
					case "(General) Thread wait"
						if d>=0 then
							twait=d
							ui_listbox_replacestring(list_optionssolver,i,s+": "+str(twait))
						else ui_editbox_settext(output_text,"Error: solver options (A1)")
						end if
					case "(General) Entropy weight"
						if d>0 then
							solvesub_entweight=d
							select case solvesub_entweight
								case 0.25:solvesub_fastent=1
								case 0.5:solvesub_fastent=2
								case 0.75:solvesub_fastent=3
								case 1:solvesub_fastent=4
								case 1.5:solvesub_fastent=5
								case 2:solvesub_fastent=6
								case else:solvesub_fastent=0
							end select
							ui_listbox_replacestring(list_optionssolver,i,s+": "+str(solvesub_entweight))
						else ui_editbox_settext(output_text,"Error: solver options (A1)")
						end if
					case "(General) Iterations"
						if d>=100000 then
							solvesub_iterations=d
							ui_listbox_replacestring(list_optionssolver,i,s+": "+str(solvesub_iterations))
						else ui_editbox_settext(output_text,"Error: solver options (A1)")
						end if
					case "(General) Iterations factor"
						if d>=1 then
							solvesub_iterationsfactor=d
							ui_listbox_replacestring(list_optionssolver,i,s+": "+str(solvesub_iterationsfactor))
						else ui_editbox_settext(output_text,"Error: solver options (A1)")
						end if
					case "(General) Hill climber iterations"
						if d>=1000 then
							solvesub_hciterations=d
							ui_listbox_replacestring(list_optionssolver,i,s+": "+str(solvesub_hciterations))
						else ui_editbox_settext(output_text,"Error: solver options (A1)")
						end if
					case "(General) Hill climber iterations factor"
						if d>=1 then
							solvesub_hciterationsfactor=d
							ui_listbox_replacestring(list_optionssolver,i,s+": "+str(solvesub_hciterationsfactor))
						else ui_editbox_settext(output_text,"Error: solver options (A1)")
						end if
					case "(General) N-gram factor"
						if d>0 then
							solvesub_ngramfactor=d
							ui_listbox_replacestring(list_optionssolver,i,s+": "+rdc(solvesub_ngramfactor,5))
						else ui_editbox_settext(output_text,"Error: solver options (A1)")
						end if
					case "(General) Multiplicity weight"
						if d>=0 then
							solvesub_multiplicityweight=d
							ui_listbox_replacestring(list_optionssolver,i,s+": "+str(solvesub_multiplicityweight))
						else ui_editbox_settext(output_text,"Error: solver options (A1)")
						end if
					case "(General) Output to file"
						if d=0 or d=1 then
							solvesub_outputdir=d
							ui_listbox_replacestring(list_optionssolver,i,s+": "+yesno(solvesub_outputdir))
						else ui_editbox_settext(output_text,"Error: solver options (A1)")
						end if
					case "(General) Output to batch"
						if d=0 or d=1 then
							solvesub_outputbatch=d
							ui_listbox_replacestring(list_optionssolver,i,s+": "+yesno(solvesub_outputbatch))
						else ui_editbox_settext(output_text,"Error: solver options (A1)")
						end if
					case "(General) Output improvements only" 
						if d=0 or d=1 then
							solvesub_outputimp=d
							ui_listbox_replacestring(list_optionssolver,i,s+": "+yesno(solvesub_outputimp))
						else ui_editbox_settext(output_text,"Error: solver options (A1)")
						end if
					case "(General) Output scores over" 
						if d>=0 then
							solvesub_scoreover=d
							ui_listbox_replacestring(list_optionssolver,i,s+": "+str(solvesub_scoreover))
						else ui_editbox_settext(output_text,"Error: solver options (A1)")
						end if
					case "(General) Output additional stats" 
						if d=0 or d=1 then
							solvesub_advstats=d
							ui_listbox_replacestring(list_optionssolver,i,s+": "+yesno(solvesub_advstats))
						else ui_editbox_settext(output_text,"Error: solver options (A1)")
						end if
					case "(General) Overwrite existing solver output" 
						if d=0 or d=1 then
							solvesub_overwriteoutput=d
							ui_listbox_replacestring(list_optionssolver,i,s+": "+yesno(solvesub_overwriteoutput))
						else ui_editbox_settext(output_text,"Error: solver options (A1)")
						end if
					case "(General) Add PC-cycles to file output format" 
						if d=0 or d=1 then
							solvesub_pccyclesformat=d
							ui_listbox_replacestring(list_optionssolver,i,s+": "+yesno(solvesub_pccyclesformat))
						else ui_editbox_settext(output_text,"Error: solver options (A1)")
						end if
					case "(General) Restarts"
						if d>=1 then
							solvesub_restarts=d
							ui_listbox_replacestring(list_optionssolver,i,s+": "+str(solvesub_restarts))
						else ui_editbox_settext(output_text,"Error: solver options (A1)")
						end if
					case "(General) Temperature"
						if d>0 then
							solvesub_temperature=d
							ui_listbox_replacestring(list_optionssolver,i,s+": "+str(solvesub_temperature))
						else ui_editbox_settext(output_text,"Error: solver options (A1)")
						end if
					case "(General) Enable memory checks"
						if d=0 or d=1 then
							memcheck=d
							ui_listbox_replacestring(list_optionssolver,i,s+": "+yesno(memcheck))
						else ui_editbox_settext(output_text,"Error: solver options (A1)")
						end if
					case "(General) Enable screen size checks"
						if d=0 or d=1 then
							screensizecheck=d
							ui_listbox_replacestring(list_optionssolver,i,s+": "+yesno(screensizecheck))
						else ui_editbox_settext(output_text,"Error: solver options (A1)")
						end if
					case "(Batch n-grams) Iterations"
						if d>=1 then
							solvesub_batchngramsrestarts=d
							ui_listbox_replacestring(list_optionssolver,i,s+": "+str(solvesub_batchngramsrestarts))
						else ui_editbox_settext(output_text,"Error: solver options (A1)")
						end if
					case "(Batch ciphers & n-grams) Shutdown computer after task completion"
						if d=0 or d=1 then
							solvesub_batchshutdown=d
							ui_listbox_replacestring(list_optionssolver,i,s+": "+yesno(solvesub_batchshutdown))
						else ui_editbox_settext(output_text,"Error: solver options (A1)")
						end if
					case "(Bigram substitution) Output heatmap"
						if d=0 or d=1 then
							solvesub_bigramheatmap=d
							ui_listbox_replacestring(list_optionssolver,i,s+": "+yesno(solvesub_bigramheatmap))
						else ui_editbox_settext(output_text,"Error: solver options (A1)")
						end if
					case "(Bigram substitution) Use best solution"
						if d=0 or d=1 then
							solvesub_bigrambestsol=d
							ui_listbox_replacestring(list_optionssolver,i,s+": "+yesno(solvesub_bigrambestsol))
						else ui_editbox_settext(output_text,"Error: solver options (A1)")
						end if
					case "(Bigram substitution) Auto-crib restarts"
						if d>=0 andalso d<=1000000 then
							solvesub_bigramautocrib=d
							ui_listbox_replacestring(list_optionssolver,i,s+": "+str(solvesub_bigramautocrib))
						else ui_editbox_settext(output_text,"Error: solver options (A1)")
						end if
					case "(Bigram substitution) Bigram homophone weight divider"
						if d>=0 andalso d<=1000000 then
							solvesub_bigramhomwdiv=d
							ui_listbox_replacestring(list_optionssolver,i,s+": "+str(solvesub_bigramhomwdiv))
						else ui_editbox_settext(output_text,"Error: solver options (A1)")
						end if
						
					'case "(Substitution) Add multiplicity reducing prefix and suffix"
					'	if d=0 or d=1 then
					'		solvesub_prefixaid=d
					'		ui_listbox_replacestring(list_optionssolver,i,s+": "+yesno(solvesub_prefixaid))
					'	else ui_editbox_settext(output_text,"Error: solver options (A1)")
					'	end if
						
					'case "(Substitution + columnar transposition & rearrangement) Columns"
					'	if d>=2 andalso d<=2000 then
					'		solvesub_ctcolumns=d
					'		ui_listbox_replacestring(list_optionssolver,i,s+": "+str(solvesub_ctcolumns))
					'	else ui_editbox_settext(output_text,"Error: solver options (A1)")
					'	end if
						
					case "(Substitution + columnar transposition & rearrangement) Search depth"
						if d>=1 andalso d<=7 then
							solvesub_ctdepth=d
							ui_listbox_replacestring(list_optionssolver,i,s+": "+str(solvesub_ctdepth))
						else ui_editbox_settext(output_text,"Error: solver options (A1)")
						end if
					case "(Substitution + columnar transposition & rearrangement) Use bigrams"
						if d=0 or d=1 then
							solvesub_ctmode=d
							ui_listbox_replacestring(list_optionssolver,i,s+": "+yesno(solvesub_ctmode))
						else ui_editbox_settext(output_text,"Error: solver options (A1)")
						end if
					case "(Substitution + nulls and skips) Period"
						if d>=1 andalso d<=2000 then
							solvesub_pnperiod=d
							ui_listbox_replacestring(list_optionssolver,i,s+": "+str(solvesub_pnperiod))
						else ui_editbox_settext(output_text,"Error: solver options (A1)")
						end if
					case "(Substitution + nulls and skips) Nulls and skips"
						if d>=1 andalso d<=1000 then
							solvesub_pnnulls=d
							ui_listbox_replacestring(list_optionssolver,i,s+": "+str(solvesub_pnnulls))
						else ui_editbox_settext(output_text,"Error: solver options (A1)")
						end if
					case "(Substitution + nulls and skips) Manual nulls"
						if d>=0 andalso d<=1000 then
							solvesub_pnmannulls=d
							ui_listbox_replacestring(list_optionssolver,i,s+": "+str(solvesub_pnmannulls))
						else ui_editbox_settext(output_text,"Error: solver options (A1)")
						end if
					case "(Substitution + nulls and skips) Manual skips"
						if d>=0 andalso d<=1000 then
							solvesub_pnmanskips=d
							ui_listbox_replacestring(list_optionssolver,i,s+": "+str(solvesub_pnmanskips))
						else ui_editbox_settext(output_text,"Error: solver options (A1)")
						end if
					
					'-----------------------------------------------------------------------------
				
					case "(Substitution + nulls and skips) *** Temp ***"
						if d>0 andalso d<=1000 then
							solvesub_nshctemp=d
							ui_listbox_replacestring(list_optionssolver,i,s+": "+str(solvesub_nshctemp))
						else ui_editbox_settext(output_text,"Error: solver options (A1)")
						end if
					case "(Substitution + nulls and skips) *** Shift % ***"
						if d>=0 andalso d<=100 then
							solvesub_nshcshift=d
							ui_listbox_replacestring(list_optionssolver,i,s+": "+str(solvesub_nshcshift))
						else ui_editbox_settext(output_text,"Error: solver options (A1)")
						end if
					case "(Substitution + nulls and skips) *** Shift div ***"
						if d>0 andalso d<=10 then
							solvesub_nshcshiftdiv=d
							ui_listbox_replacestring(list_optionssolver,i,s+": "+str(solvesub_nshcshiftdiv))
						else ui_editbox_settext(output_text,"Error: solver options (A1)")
						end if
					case "(Substitution + nulls and skips) *** Restarts ***"
						if d>=1 andalso d<=1000000 then
							solvesub_nshcrestartsmax=d
							ui_listbox_replacestring(list_optionssolver,i,s+": "+str(solvesub_nshcrestartsmax))
						else ui_editbox_settext(output_text,"Error: solver options (A1)")
						end if
					case "(Substitution + nulls and skips) *** Over ***"
						if d>=0 andalso d<=1000000 then
							solvesub_pnover=d
							ui_listbox_replacestring(list_optionssolver,i,s+": "+str(solvesub_pnover))
						else ui_editbox_settext(output_text,"Error: solver options (A1)")
						end if
					case "(Substitution + nulls and skips) *** Over skip ***"
						if d=0 or d=1 then
							solvesub_pnoverskip=d
							ui_listbox_replacestring(list_optionssolver,i,s+": "+yesno(solvesub_pnoverskip))
						else ui_editbox_settext(output_text,"Error: solver options (A1)")
						end if
					case "(Substitution + nulls and skips) Search depth"
						if d>=1 andalso d<=7 then
							change=1
							solvesub_pndepth=d
							ui_listbox_replacestring(list_optionssolver,i,s+": "+str(solvesub_pndepth))
						else ui_editbox_settext(output_text,"Error: solver options (A1)")
						end if																				
					case "(Substitution + polyphones [auto]) Extra letters"
						if d>0 then
							solvesub_polyphones=d
							ui_listbox_replacestring(list_optionssolver,i,s+": "+str(solvesub_polyphones))
						else ui_editbox_settext(output_text,"Error: solver options (A1)")
						end if
					case "(Substitution + polyphones [auto]) Increment extra letters"
						if d=0 or d=1 then
							solvesub_incpolyphones=d
							ui_listbox_replacestring(list_optionssolver,i,s+": "+yesno(solvesub_incpolyphones))
						else ui_editbox_settext(output_text,"Error: solver options (A1)")
						end if
						
						
					case "(Substitution + row bound fragments) Fragments"
						if d>=0 or d<=2000 then
							solvesub_rowboundfragments=d
							ui_listbox_replacestring(list_optionssolver,i,s+": "+str(solvesub_rowboundfragments))
						else ui_editbox_settext(output_text,"Error: solver options (A1)")
						end if
					case "(Substitution + row bound fragments) Temperature"
						if d>=0 or d<=1000000 then
							solvesub_rowboundtemp=d
							ui_listbox_replacestring(list_optionssolver,i,s+": "+str(solvesub_rowboundtemp))
						else ui_editbox_settext(output_text,"Error: solver options (A1)")
						end if
					case "(Substitution + row bound fragments) Fragments"
						if d>=1 or d<=2000 then
							solvesub_rowboundfragments=d
							ui_listbox_replacestring(list_optionssolver,i,s+": "+str(solvesub_rowboundfragments))
						else ui_editbox_settext(output_text,"Error: solver options (A1)")
						end if
					case "(Substitution + row bound fragments) Crib history table size"
						if d>=0 or d<=1000000 then
							solvesub_rowboundhkeys=d
							ui_listbox_replacestring(list_optionssolver,i,s+": "+str(solvesub_rowboundhkeys))
						else ui_editbox_settext(output_text,"Error: solver options (A1)")
						end if
					case "(Substitution + row bound fragments) Crib history table mode"
						if d=0 or d=1 then
							solvesub_rowbounddistinctmode=d
							ui_listbox_replacestring(list_optionssolver,i,s+": "+str(solvesub_rowbounddistinctmode))
						else ui_editbox_settext(output_text,"Error: solver options (A1)")
						end if
					case "(Substitution + row bound fragments) Crib HC iteration factor"
						if d>=0 or d<=1000000 then
							solvesub_rowboundhcmode1itfact=d
							ui_listbox_replacestring(list_optionssolver,i,s+": "+str(solvesub_rowboundhcmode1itfact))
						else ui_editbox_settext(output_text,"Error: solver options (A1)")
						end if
					case "(Substitution + row bound fragments) Crib distinctiveness"
						if d>=0 or d<=1 then
							solvesub_rowbounddistinct=d
							ui_listbox_replacestring(list_optionssolver,i,s+": "+str(solvesub_rowbounddistinct))
						else ui_editbox_settext(output_text,"Error: solver options (A1)")
						end if
					case "(Substitution + row bound fragments) Fine tune"
						if d>=0 or d<=1 then
							solvesub_rowboundfine=d
							ui_listbox_replacestring(list_optionssolver,i,s+": "+str(solvesub_rowboundfine))
						else ui_editbox_settext(output_text,"Error: solver options (A1)")
						end if
					case "(Substitution + row bound fragments) Over"
						if d>=0 or d<=1000000 then
							solvesub_rowboundover=d
							ui_listbox_replacestring(list_optionssolver,i,s+": "+str(solvesub_rowboundover))
						else ui_editbox_settext(output_text,"Error: solver options (A1)")
						end if
					case "(Substitution + row bound fragments) Crib fragments"
						if d>=1 or d<=2000 then
							solvesub_rowboundcribfragments=d
							ui_listbox_replacestring(list_optionssolver,i,s+": "+str(solvesub_rowboundcribfragments))
						else ui_editbox_settext(output_text,"Error: solver options (A1)")
						end if
					case "(Substitution + row bound fragments) Sub restarts"
						if d>=1 or d<=1000000 then
							solvesub_rowboundsubrestarts=d
							ui_listbox_replacestring(list_optionssolver,i,s+": "+str(solvesub_rowboundsubrestarts))
						else ui_editbox_settext(output_text,"Error: solver options (A1)")
						end if
					case "(Substitution + row bound fragments) Crib output history table"
						if d=0 or d=1 then
							solvesub_rowboundcheckhistory=d
							ui_listbox_replacestring(list_optionssolver,i,s+": "+yesno(solvesub_rowboundcheckhistory))
						else ui_editbox_settext(output_text,"Error: solver options (A1)")
						end if
						
						
					case "(Substitution + sequential homophones) Sequential weight"
						if d>=0 then
							solvesub_seqweight=d
							ui_listbox_replacestring(list_optionssolver,i,s+": "+str(solvesub_seqweight))
						else ui_editbox_settext(output_text,"Error: solver options (A1)")
						end if
					case "(Substitution + sparse polyalphabetism) Polyalphabetism weight"
						if d>=0 then
							solvesub_matchweight=d
							ui_listbox_replacestring(list_optionssolver,i,s+": "+str(solvesub_matchweight))
						else ui_editbox_settext(output_text,"Error: solver options (A1)")
						end if			
					case "(Substitution + simple transposition) Use sequential homophones"
						if d=0 or d=1 then
							solvesub_tpseqhom=d
							ui_listbox_replacestring(list_optionssolver,i,s+": "+yesno(solvesub_tpseqhom))
						else ui_editbox_settext(output_text,"Error: solver options (A1)")
						end if
					case "(Substitution + simple transposition) PC-cycles, use untransposed texts"
						if d=0 or d=1 then
							solvesub_pcmode=d
							ui_listbox_replacestring(list_optionssolver,i,s+": "+yesno(solvesub_pcmode))
						else ui_editbox_settext(output_text,"Error: solver options (A1)")
						end if
					case "(Substitution + vigen�re) Keyword length"
						if d>0 then
							solvesub_vigenerekeylength=d
							ui_listbox_replacestring(list_optionssolver,i,s+": "+str(solvesub_vigenerekeylength))
						else ui_editbox_settext(output_text,"Error: solver options (A1)")
						end if
					case "(Substitution + vigen�re) By columns"
						if d=0 or d=1 then
							solvesub_vigenerebycolumns=d
							ui_listbox_replacestring(list_optionssolver,i,s+": "+yesno(solvesub_vigenerebycolumns))
						else ui_editbox_settext(output_text,"Error: solver options (A1)")
						end if
					case "(Substitution + vigen�re) Use subtraction"
						if d=0 or d=1 then
							solvesub_vigeneresubtract=d
							ui_listbox_replacestring(list_optionssolver,i,s+": "+yesno(solvesub_vigeneresubtract))
						else ui_editbox_settext(output_text,"Error: solver options (A1)")
						end if		
					case "(Merge sequential homophones) Cycle length weight"
						if d>0 andalso d<=1 then
							change=1
							solvesub_cyclelengthweight=d
							ui_listbox_replacestring(list_optionssolver,i,s+": "+str(solvesub_cyclelengthweight))
						else ui_editbox_settext(output_text,"Error: solver options (A1)")
						end if
					case "(Merge sequential homophones) Target alphabet size"
						if d>2 andalso d<=256 then
							change=1
							solvesub_cyclealphabetsize=d
							ui_listbox_replacestring(list_optionssolver,i,s+": "+str(solvesub_cyclealphabetsize))
						else ui_editbox_settext(output_text,"Error: solver options (A1)")
						end if
					case "(Merge sequential homophones) Use random arguments"
						if d=0 or d=1 then
							change=1
							solvesub_rndcyclearg=d
							ui_listbox_replacestring(list_optionssolver,i,s+": "+yesno(solvesub_rndcyclearg))
						else ui_editbox_settext(output_text,"Error: solver options (A1)")
						end if
				end select
				ui_listbox_setcursel(list_optionssolver,i)
				if change=1 then
					stop_current_task
					toggle_solverthreads(empty(),0,0,0,0,basedir+"\Output\",4,1,threads) 'stop solver
					toggle_solverthreads(empty(),0,0,0,0,basedir+"\Output\",2,1,threads) 'stop thread
					threads=solvesub_cputhreads 'update threads
					redim thread(threads)
					toggle_solverthreads(empty(),0,0,0,0,basedir+"\Output\",1,1,threads) 'start thread
					stoptask=0
				end if
			else ui_editbox_settext(output_text,"Error: "+task_active)
			end if
		else ui_editbox_settext(output_text,"Error: solver options (A1)")
		end if
	end if