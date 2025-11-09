if CoD and CoD.rankTable then
	CoD.MAX_RANK = tonumber( Engine.TableLookup( 0, CoD.rankTable, 0, "maxrank", 1 ) )
	CoD.MAX_RANKXP = tonumber( Engine.TableLookup( 0, CoD.rankTable, 0, CoD.MAX_RANK, 7 ) )
end
EnableGlobals()
function FeaturedCardsActionButtonHandler( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4 )
	local f1_local0 = f1_arg0:getParentMenu()
	local f1_local1 = nil
	local f1_local2 = ""
	if f1_arg0.LeftContainer.FEFeaturedCardsContainer.CardsList.activeWidget ~= nil then
		f1_local1 = Engine.GetFeaturedCard( f1_arg0.LeftContainer.FEFeaturedCardsContainer.CardsList.activeWidget.gridInfoTable.zeroBasedIndex )
		f1_local2 = string.lower( f1_local1.action )
	end
	if f1_local2 == "openwelcome" then
		OpenOverlay( f1_local0, "WelcomeMenu", f1_arg2 )
	elseif f1_local2 == "store" then
		if CoD.isPC then
			OpenSteamStore( f1_arg0, f1_arg1, f1_arg2, "FeaturedWidget", f1_local0 )
		else
			OpenStore( f1_arg0, f1_arg1, f1_arg2, "FeaturedWidget", f1_local0 )
		end
	elseif f1_local2 == "opengroups" then
		OpenGroups( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_local0 )
	elseif f1_local2 == "openCRM" then
		
	elseif f1_local2 == "openmotd" and Engine.StorageIsFileReady( f1_arg2, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE ) then
		local f1_local3 = Engine.StorageGetBuffer( f1_arg2, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
		f1_local3.motdVersionViewed:set( 0 )
		OpenMOTDPopup( f1_arg0, f1_arg1, f1_arg2, "FeaturedWidget", f1_local0 )
	end
end

function OpenRegistrationBrowser( f2_arg0, f2_arg1, f2_arg2, f2_arg3 )
	local f2_local0 = GoBack( f2_arg0, f2_arg2 )
	local f2_local1 = OpenOverlay( f2_local0, "Spinner", f2_arg2 )
	f2_local1:registerEventHandler( "registration_success", function ( element, event )
		CoD.OverlayUtility.CreateOverlay( f2_arg2, f2_local0, "RegistrationSuccess" )
		element:close()
	end )
	f2_local1:registerEventHandler( "registration_failure", function ( element, event, f4_arg2 )
		FinishRegistrationFlow( element, f2_arg2, element )
	end )
	Engine.OpenRegistrationBrowser( f2_arg2 )
end

function FinishRegistrationFlow( f5_arg0, f5_arg1, f5_arg2 )
	local f5_local0 = "registration"
	Engine.ReportMarketingMessageViewed( f5_arg1, f5_local0 )
	LUI.CoDMetrics.CRMMessageImpression( f5_arg0, f5_arg1, f5_local0 )
	if Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( f5_arg1 ), "MOTDMenu.ActionSource" ) ) == "FeaturedWidget" then
		GoBack( f5_arg2, f5_arg1 )
		return 
	elseif Dvar.ui_execdemo_beta:get() then
		if IsFirstTimeSetup( f5_arg1, Enum.eModes.MODE_MULTIPLAYER ) then
			OpenMPFirstTimeFlow( f5_arg0, nil, f5_arg1, nil, f5_arg2 )
		else
			local f5_local1 = LobbyData:GetCurrentMenuTarget()
			if f5_local1.id == LobbyData.UITargets.UI_MAIN.id then
				NavigateToLobby_FirstTimeFlowMP( f5_arg0, nil, f5_arg1, f5_arg2 )
			else
				GoBackToMenu( f5_arg2, f5_arg1, "Lobby" )
				return 
			end
		end
	else
		NavigateToLobby( f5_arg0, "ModeSelect", false, f5_arg1 )
	end
	SendClientScriptMenuChangeNotify( f5_arg1, f5_arg2, false )
	Close( f5_arg0, f5_arg1 )
end

