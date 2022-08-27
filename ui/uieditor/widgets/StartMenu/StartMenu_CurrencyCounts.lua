-- 1aacfa9fd2d4749719e650d0166a4803
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.BlackMarket.BM_CryptokeyCounterIcon" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_CODpoints" )

CoD.StartMenu_CurrencyCounts = InheritFrom( LUI.UIElement )
CoD.StartMenu_CurrencyCounts.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.StartMenu_CurrencyCounts )
	self.id = "StartMenu_CurrencyCounts"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 204 )
	self:setTopBottom( true, false, 0, 30 )
	self.anyChildUsesUpdateState = true
	
	local BMCryptokeyCounterIcon = CoD.BM_CryptokeyCounterIcon.new( menu, controller )
	BMCryptokeyCounterIcon:setLeftRight( true, false, 77, 102 )
	BMCryptokeyCounterIcon:setTopBottom( true, false, 3, 27 )
	self:addElement( BMCryptokeyCounterIcon )
	self.BMCryptokeyCounterIcon = BMCryptokeyCounterIcon
	
	local cryptokeyCount = LUI.UITightText.new()
	cryptokeyCount:setLeftRight( true, false, 103, 151.25 )
	cryptokeyCount:setTopBottom( false, false, -11, 11 )
	cryptokeyCount:setTTF( "fonts/default.ttf" )
	cryptokeyCount:subscribeToGlobalModel( controller, "CryptoKeyProgress", "keyCount", function ( model )
		local keyCount = Engine.GetModelValue( model )
		if keyCount then
			cryptokeyCount:setText( Engine.Localize( SetValueIfNumberEqualTo( -1, "-", keyCount ) ) )
		end
	end )
	self:addElement( cryptokeyCount )
	self.cryptokeyCount = cryptokeyCount
	
	local vial = LUI.UIImage.new()
	vial:setLeftRight( true, false, 150.25, 175.25 )
	vial:setTopBottom( false, false, -12.5, 12.5 )
	vial:setImage( RegisterImage( "uie_t7_hud_zm_vial_aar_256" ) )
	self:addElement( vial )
	self.vial = vial
	
	local vialCount = LUI.UITightText.new()
	vialCount:setLeftRight( true, false, 171, 204 )
	vialCount:setTopBottom( false, false, -11, 11 )
	vialCount:setTTF( "fonts/default.ttf" )
	vialCount:subscribeToGlobalModel( controller, "MegaChewTokens", "remainingTokens", function ( model )
		local remainingTokens = Engine.GetModelValue( model )
		if remainingTokens then
			vialCount:setText( Engine.Localize( SetValueIfNumberEqualTo( -1, "-", remainingTokens ) ) )
		end
	end )
	self:addElement( vialCount )
	self.vialCount = vialCount
	
	local StartMenuCODpoints = CoD.StartMenu_CODpoints.new( menu, controller )
	StartMenuCODpoints:setLeftRight( true, false, -0.25, 76 )
	StartMenuCODpoints:setTopBottom( true, false, 2.5, 27.5 )
	StartMenuCODpoints:subscribeToGlobalModel( controller, "CryptoKeyProgress", "codPoints", function ( model )
		local codPoints = Engine.GetModelValue( model )
		if codPoints then
			StartMenuCODpoints.codpointsCount:setText( Engine.Localize( SetValueIfNumberEqualTo( -1, "-", codPoints ) ) )
		end
	end )
	self:addElement( StartMenuCODpoints )
	self.StartMenuCODpoints = StartMenuCODpoints
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				BMCryptokeyCounterIcon:completeAnimation()
				self.BMCryptokeyCounterIcon:setAlpha( 0 )
				self.clipFinished( BMCryptokeyCounterIcon, {} )
				cryptokeyCount:completeAnimation()
				self.cryptokeyCount:setAlpha( 0 )
				self.clipFinished( cryptokeyCount, {} )
				vial:completeAnimation()
				self.vial:setAlpha( 0 )
				self.clipFinished( vial, {} )
				vialCount:completeAnimation()
				self.vialCount:setAlpha( 0 )
				self.clipFinished( vialCount, {} )
				StartMenuCODpoints:completeAnimation()
				self.StartMenuCODpoints:setAlpha( 0 )
				self.clipFinished( StartMenuCODpoints, {} )
			end
		},
		ShowKeysAndVials = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				BMCryptokeyCounterIcon:completeAnimation()
				self.BMCryptokeyCounterIcon:setAlpha( 1 )
				self.clipFinished( BMCryptokeyCounterIcon, {} )
				cryptokeyCount:completeAnimation()
				self.cryptokeyCount:setAlpha( 1 )
				self.clipFinished( cryptokeyCount, {} )
				vial:completeAnimation()
				self.vial:setAlpha( 1 )
				self.clipFinished( vial, {} )
				vialCount:completeAnimation()
				self.vialCount:setAlpha( 1 )
				self.clipFinished( vialCount, {} )
				StartMenuCODpoints:completeAnimation()
				self.StartMenuCODpoints:setAlpha( 0 )
				self.clipFinished( StartMenuCODpoints, {} )
			end
		},
		Shown = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				BMCryptokeyCounterIcon:completeAnimation()
				self.BMCryptokeyCounterIcon:setAlpha( 1 )
				self.clipFinished( BMCryptokeyCounterIcon, {} )
				cryptokeyCount:completeAnimation()
				self.cryptokeyCount:setAlpha( 1 )
				self.clipFinished( cryptokeyCount, {} )
				vial:completeAnimation()
				self.vial:setAlpha( 1 )
				self.clipFinished( vial, {} )
				vialCount:completeAnimation()
				self.vialCount:setAlpha( 1 )
				self.clipFinished( vialCount, {} )
				StartMenuCODpoints:completeAnimation()
				self.StartMenuCODpoints:setAlpha( 1 )
				self.clipFinished( StartMenuCODpoints, {} )
			end
		},
		ShownOnlyCODPoints = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				BMCryptokeyCounterIcon:completeAnimation()
				self.BMCryptokeyCounterIcon:setAlpha( 0 )
				self.clipFinished( BMCryptokeyCounterIcon, {} )
				cryptokeyCount:completeAnimation()
				self.cryptokeyCount:setAlpha( 0 )
				self.clipFinished( cryptokeyCount, {} )
				vial:completeAnimation()
				self.vial:setAlpha( 0 )
				self.clipFinished( vial, {} )
				vialCount:completeAnimation()
				self.vialCount:setAlpha( 0 )
				self.clipFinished( vialCount, {} )
				StartMenuCODpoints:completeAnimation()
				self.StartMenuCODpoints:setAlpha( 1 )
				self.clipFinished( StartMenuCODpoints, {} )
			end
		},
		ShownOnlyKeys = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				BMCryptokeyCounterIcon:completeAnimation()
				self.BMCryptokeyCounterIcon:setAlpha( 1 )
				self.clipFinished( BMCryptokeyCounterIcon, {} )
				cryptokeyCount:completeAnimation()
				self.cryptokeyCount:setAlpha( 1 )
				self.clipFinished( cryptokeyCount, {} )
				vial:completeAnimation()
				self.vial:setAlpha( 0 )
				self.clipFinished( vial, {} )
				vialCount:completeAnimation()
				self.vialCount:setAlpha( 0 )
				self.clipFinished( vialCount, {} )
				StartMenuCODpoints:completeAnimation()
				self.StartMenuCODpoints:setAlpha( 0 )
				self.clipFinished( StartMenuCODpoints, {} )
			end
		},
		ShownAllExceptVials = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				BMCryptokeyCounterIcon:completeAnimation()
				self.BMCryptokeyCounterIcon:setLeftRight( true, false, 129.75, 154.75 )
				self.BMCryptokeyCounterIcon:setTopBottom( true, false, 3, 27 )
				self.BMCryptokeyCounterIcon:setAlpha( 1 )
				self.clipFinished( BMCryptokeyCounterIcon, {} )
				cryptokeyCount:completeAnimation()
				self.cryptokeyCount:setLeftRight( true, false, 155.75, 204 )
				self.cryptokeyCount:setTopBottom( false, false, -11, 11 )
				self.cryptokeyCount:setAlpha( 1 )
				self.clipFinished( cryptokeyCount, {} )
				vial:completeAnimation()
				self.vial:setAlpha( 0 )
				self.clipFinished( vial, {} )
				vialCount:completeAnimation()
				self.vialCount:setAlpha( 0 )
				self.clipFinished( vialCount, {} )
				StartMenuCODpoints:completeAnimation()
				self.StartMenuCODpoints:setAlpha( 1 )
				self.clipFinished( StartMenuCODpoints, {} )
			end,
			Bonus = function ()
				self:setupElementClipCounter( 4 )
				BMCryptokeyCounterIcon:completeAnimation()
				self.BMCryptokeyCounterIcon:setLeftRight( true, false, 129.75, 154.75 )
				self.BMCryptokeyCounterIcon:setTopBottom( false, false, -12, 12 )
				self.BMCryptokeyCounterIcon:setAlpha( 1 )
				self.clipFinished( BMCryptokeyCounterIcon, {} )
				local cryptokeyCountFrame2 = function ( cryptokeyCount, event )
					local cryptokeyCountFrame3 = function ( cryptokeyCount, event )
						local cryptokeyCountFrame4 = function ( cryptokeyCount, event )
							local cryptokeyCountFrame5 = function ( cryptokeyCount, event )
								if not event.interrupted then
									cryptokeyCount:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
								end
								cryptokeyCount:setLeftRight( true, false, 155.75, 204 )
								cryptokeyCount:setTopBottom( false, false, -11, 11 )
								cryptokeyCount:setAlpha( 1 )
								cryptokeyCount:setScale( 1 )
								if event.interrupted then
									self.clipFinished( cryptokeyCount, event )
								else
									cryptokeyCount:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								cryptokeyCountFrame5( cryptokeyCount, event )
								return 
							else
								cryptokeyCount:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
								cryptokeyCount:setLeftRight( true, false, 165.75, 214 )
								cryptokeyCount:setScale( 1.5 )
								cryptokeyCount:registerEventHandler( "transition_complete_keyframe", cryptokeyCountFrame5 )
							end
						end
						
						if event.interrupted then
							cryptokeyCountFrame4( cryptokeyCount, event )
							return 
						else
							cryptokeyCount:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
							cryptokeyCount:setLeftRight( true, false, 160.75, 209 )
							cryptokeyCount:setScale( 1.24 )
							cryptokeyCount:registerEventHandler( "transition_complete_keyframe", cryptokeyCountFrame4 )
						end
					end
					
					if event.interrupted then
						cryptokeyCountFrame3( cryptokeyCount, event )
						return 
					else
						cryptokeyCount:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
						cryptokeyCount:registerEventHandler( "transition_complete_keyframe", cryptokeyCountFrame3 )
					end
				end
				
				cryptokeyCount:completeAnimation()
				self.cryptokeyCount:setLeftRight( true, false, 155.75, 204 )
				self.cryptokeyCount:setTopBottom( false, false, -11, 11 )
				self.cryptokeyCount:setAlpha( 1 )
				self.cryptokeyCount:setScale( 1 )
				cryptokeyCountFrame2( cryptokeyCount, {} )
				vial:completeAnimation()
				self.vial:setAlpha( 0 )
				self.clipFinished( vial, {} )
				vialCount:completeAnimation()
				self.vialCount:setAlpha( 0 )
				self.clipFinished( vialCount, {} )
			end
		},
		ShownOnlyVials = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				BMCryptokeyCounterIcon:completeAnimation()
				self.BMCryptokeyCounterIcon:setAlpha( 0 )
				self.clipFinished( BMCryptokeyCounterIcon, {} )
				cryptokeyCount:completeAnimation()
				self.cryptokeyCount:setAlpha( 0 )
				self.clipFinished( cryptokeyCount, {} )
				vial:completeAnimation()
				self.vial:setLeftRight( true, false, 82.25, 107.25 )
				self.vial:setTopBottom( false, false, -12.5, 12.5 )
				self.vial:setAlpha( 1 )
				self.clipFinished( vial, {} )
				vialCount:completeAnimation()
				self.vialCount:setLeftRight( true, false, 103, 136 )
				self.vialCount:setTopBottom( false, false, -11, 11 )
				self.vialCount:setAlpha( 1 )
				self.clipFinished( vialCount, {} )
				StartMenuCODpoints:completeAnimation()
				self.StartMenuCODpoints:setAlpha( 0 )
				self.clipFinished( StartMenuCODpoints, {} )
			end
		},
		ShownAllExceptCryptoKeys = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				BMCryptokeyCounterIcon:completeAnimation()
				self.BMCryptokeyCounterIcon:setAlpha( 0 )
				self.clipFinished( BMCryptokeyCounterIcon, {} )
				cryptokeyCount:completeAnimation()
				self.cryptokeyCount:setAlpha( 0 )
				self.clipFinished( cryptokeyCount, {} )
				vial:completeAnimation()
				self.vial:setLeftRight( true, false, 78, 103 )
				self.vial:setTopBottom( false, false, -12.5, 12.5 )
				self.vial:setAlpha( 1 )
				self.clipFinished( vial, {} )
				vialCount:completeAnimation()
				self.vialCount:setLeftRight( true, false, 98.75, 131.75 )
				self.vialCount:setTopBottom( false, false, -11, 11 )
				self.vialCount:setAlpha( 1 )
				self.clipFinished( vialCount, {} )
				StartMenuCODpoints:completeAnimation()
				self.StartMenuCODpoints:setAlpha( 1 )
				self.clipFinished( StartMenuCODpoints, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "ShowKeysAndVials",
			condition = function ( menu, element, event )
				return IsLootReady( controller ) and not AreCodPointsEnabled( controller )
			end
		},
		{
			stateName = "Shown",
			condition = function ( menu, element, event )
				return IsLootReady( controller )
			end
		},
		{
			stateName = "ShownOnlyCODPoints",
			condition = function ( menu, element, event )
				return IsLootReady( controller ) and AreCodPointsEnabled( controller )
			end
		},
		{
			stateName = "ShownOnlyKeys",
			condition = function ( menu, element, event )
				return IsLootReady( controller ) and not AreCodPointsEnabled( controller )
			end
		},
		{
			stateName = "ShownAllExceptVials",
			condition = function ( menu, element, event )
				return IsLootReady( controller )
			end
		},
		{
			stateName = "ShownOnlyVials",
			condition = function ( menu, element, event )
				return IsLootReady( controller ) and not AreCodPointsEnabled( controller )
			end
		},
		{
			stateName = "ShownAllExceptCryptoKeys",
			condition = function ( menu, element, event )
				return IsLootReady( controller )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "CryptoKeyProgress.keyCount" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "CryptoKeyProgress.keyCount"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNetworkMode" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNetworkMode"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.BMCryptokeyCounterIcon:close()
		element.StartMenuCODpoints:close()
		element.cryptokeyCount:close()
		element.vialCount:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

