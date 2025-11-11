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
	self:setLeftRight( 0, 0, 0, 306 )
	self:setTopBottom( 0, 0, 0, 45 )
	self.anyChildUsesUpdateState = true
	
	local BMCryptokeyCounterIcon = CoD.BM_CryptokeyCounterIcon.new( menu, controller )
	BMCryptokeyCounterIcon:setLeftRight( 0, 0, 115, 153 )
	BMCryptokeyCounterIcon:setTopBottom( 0, 0, 4, 40 )
	self:addElement( BMCryptokeyCounterIcon )
	self.BMCryptokeyCounterIcon = BMCryptokeyCounterIcon
	
	local cryptokeyCount = LUI.UITightText.new()
	cryptokeyCount:setLeftRight( 0, 0, 155, 227 )
	cryptokeyCount:setTopBottom( 0.5, 0.5, -16.5, 16.5 )
	cryptokeyCount:setTTF( "fonts/default.ttf" )
	cryptokeyCount:subscribeToGlobalModel( controller, "CryptoKeyProgress", "keyCount", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			cryptokeyCount:setText( Engine.Localize( SetValueIfNumberEqualTo( -1, "-", modelValue ) ) )
		end
	end )
	self:addElement( cryptokeyCount )
	self.cryptokeyCount = cryptokeyCount
	
	local vial = LUI.UIImage.new()
	vial:setLeftRight( 0, 0, 225, 263 )
	vial:setTopBottom( 0.5, 0.5, -19, 19 )
	vial:setImage( RegisterImage( "uie_t7_hud_zm_vial_aar_256" ) )
	self:addElement( vial )
	self.vial = vial
	
	local vialCount = LUI.UITightText.new()
	vialCount:setLeftRight( 0, 0, 256, 306 )
	vialCount:setTopBottom( 0.5, 0.5, -16.5, 16.5 )
	vialCount:setTTF( "fonts/default.ttf" )
	vialCount:subscribeToGlobalModel( controller, "MegaChewTokens", "remainingTokens", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			vialCount:setText( Engine.Localize( SetValueIfNumberEqualTo( -1, "-", modelValue ) ) )
		end
	end )
	self:addElement( vialCount )
	self.vialCount = vialCount
	
	local StartMenuCODpoints = CoD.StartMenu_CODpoints.new( menu, controller )
	StartMenuCODpoints:setLeftRight( 0, 0, 0, 114 )
	StartMenuCODpoints:setTopBottom( 0, 0, 3, 41 )
	StartMenuCODpoints:subscribeToGlobalModel( controller, "CryptoKeyProgress", "codPoints", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			StartMenuCODpoints.codpointsCount:setText( Engine.Localize( SetValueIfNumberEqualTo( -1, "-", modelValue ) ) )
		end
	end )
	self:addElement( StartMenuCODpoints )
	self.StartMenuCODpoints = StartMenuCODpoints
	
	self.resetProperties = function ()
		vial:completeAnimation()
		vialCount:completeAnimation()
		cryptokeyCount:completeAnimation()
		BMCryptokeyCounterIcon:completeAnimation()
		StartMenuCODpoints:completeAnimation()
		vial:setLeftRight( 0, 0, 225, 263 )
		vial:setTopBottom( 0.5, 0.5, -19, 19 )
		vial:setAlpha( 1 )
		vialCount:setLeftRight( 0, 0, 256, 306 )
		vialCount:setTopBottom( 0.5, 0.5, -16.5, 16.5 )
		vialCount:setAlpha( 1 )
		cryptokeyCount:setLeftRight( 0, 0, 155, 227 )
		cryptokeyCount:setTopBottom( 0.5, 0.5, -16.5, 16.5 )
		cryptokeyCount:setAlpha( 1 )
		cryptokeyCount:setScale( 1 )
		BMCryptokeyCounterIcon:setLeftRight( 0, 0, 115, 153 )
		BMCryptokeyCounterIcon:setTopBottom( 0, 0, 4, 40 )
		BMCryptokeyCounterIcon:setAlpha( 1 )
		StartMenuCODpoints:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
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
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				StartMenuCODpoints:completeAnimation()
				self.StartMenuCODpoints:setAlpha( 0 )
				self.clipFinished( StartMenuCODpoints, {} )
			end
		},
		Shown = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		ShownOnlyCODPoints = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 4 )
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
			end
		},
		ShownOnlyKeys = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
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
				self.resetProperties()
				self:setupElementClipCounter( 4 )
				BMCryptokeyCounterIcon:completeAnimation()
				self.BMCryptokeyCounterIcon:setLeftRight( 0, 0, 194, 232 )
				self.BMCryptokeyCounterIcon:setTopBottom( 0, 0, 4, 40 )
				self.clipFinished( BMCryptokeyCounterIcon, {} )
				cryptokeyCount:completeAnimation()
				self.cryptokeyCount:setLeftRight( 0, 0, 234, 306 )
				self.cryptokeyCount:setTopBottom( 0.5, 0.5, -17, 16 )
				self.clipFinished( cryptokeyCount, {} )
				vial:completeAnimation()
				self.vial:setAlpha( 0 )
				self.clipFinished( vial, {} )
				vialCount:completeAnimation()
				self.vialCount:setAlpha( 0 )
				self.clipFinished( vialCount, {} )
			end,
			Bonus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 4 )
				BMCryptokeyCounterIcon:completeAnimation()
				self.BMCryptokeyCounterIcon:setLeftRight( 0, 0, 194, 232 )
				self.BMCryptokeyCounterIcon:setTopBottom( 0.5, 0.5, -18, 18 )
				self.clipFinished( BMCryptokeyCounterIcon, {} )
				local cryptokeyCountFrame2 = function ( cryptokeyCount, event )
					local cryptokeyCountFrame3 = function ( cryptokeyCount, event )
						local cryptokeyCountFrame4 = function ( cryptokeyCount, event )
							local cryptokeyCountFrame5 = function ( cryptokeyCount, event )
								if not event.interrupted then
									cryptokeyCount:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
								end
								cryptokeyCount:setLeftRight( 0, 0, 234, 306 )
								cryptokeyCount:setTopBottom( 0.5, 0.5, -17, 16 )
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
								cryptokeyCount:setLeftRight( 0, 0, 249, 321 )
								cryptokeyCount:setScale( 1.5 )
								cryptokeyCount:registerEventHandler( "transition_complete_keyframe", cryptokeyCountFrame5 )
							end
						end
						
						if event.interrupted then
							cryptokeyCountFrame4( cryptokeyCount, event )
							return 
						else
							cryptokeyCount:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
							cryptokeyCount:setLeftRight( 0, 0, 241, 313 )
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
				self.cryptokeyCount:setLeftRight( 0, 0, 234, 306 )
				self.cryptokeyCount:setTopBottom( 0.5, 0.5, -17, 16 )
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
				self.resetProperties()
				self:setupElementClipCounter( 5 )
				BMCryptokeyCounterIcon:completeAnimation()
				self.BMCryptokeyCounterIcon:setAlpha( 0 )
				self.clipFinished( BMCryptokeyCounterIcon, {} )
				cryptokeyCount:completeAnimation()
				self.cryptokeyCount:setAlpha( 0 )
				self.clipFinished( cryptokeyCount, {} )
				vial:completeAnimation()
				self.vial:setLeftRight( 0, 0, 123, 161 )
				self.vial:setTopBottom( 0.5, 0.5, -19, 19 )
				self.clipFinished( vial, {} )
				vialCount:completeAnimation()
				self.vialCount:setLeftRight( 0, 0, 154, 204 )
				self.vialCount:setTopBottom( 0.5, 0.5, -17, 16 )
				self.clipFinished( vialCount, {} )
				StartMenuCODpoints:completeAnimation()
				self.StartMenuCODpoints:setAlpha( 0 )
				self.clipFinished( StartMenuCODpoints, {} )
			end
		},
		ShownAllExceptCryptoKeys = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 4 )
				BMCryptokeyCounterIcon:completeAnimation()
				self.BMCryptokeyCounterIcon:setAlpha( 0 )
				self.clipFinished( BMCryptokeyCounterIcon, {} )
				cryptokeyCount:completeAnimation()
				self.cryptokeyCount:setAlpha( 0 )
				self.clipFinished( cryptokeyCount, {} )
				vial:completeAnimation()
				self.vial:setLeftRight( 0, 0, 117, 155 )
				self.vial:setTopBottom( 0.5, 0.5, -19, 19 )
				self.clipFinished( vial, {} )
				vialCount:completeAnimation()
				self.vialCount:setLeftRight( 0, 0, 148, 198 )
				self.vialCount:setTopBottom( 0.5, 0.5, -17, 16 )
				self.clipFinished( vialCount, {} )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.BMCryptokeyCounterIcon:close()
		self.StartMenuCODpoints:close()
		self.cryptokeyCount:close()
		self.vialCount:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

