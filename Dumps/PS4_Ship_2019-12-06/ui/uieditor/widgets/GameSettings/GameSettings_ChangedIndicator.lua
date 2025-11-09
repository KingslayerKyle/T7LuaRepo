local PreLoadFunc = function ( self, controller )
	Engine.CreateModel( Engine.GetGlobalModel(), "GametypeSettings.Update" )
end

CoD.GameSettings_ChangedIndicator = InheritFrom( LUI.UIElement )
CoD.GameSettings_ChangedIndicator.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.GameSettings_ChangedIndicator )
	self.id = "GameSettings_ChangedIndicator"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( true, false, 0, 30 )
	self:setTopBottom( true, false, 0, 30 )
	
	local ChangedIndicator = LUI.UIImage.new()
	ChangedIndicator:setLeftRight( true, true, 5.5, -5.5 )
	ChangedIndicator:setTopBottom( true, true, 5.5, -5.5 )
	ChangedIndicator:setImage( RegisterImage( "uie_t7_gamesettings_asteriskicon" ) )
	self:addElement( ChangedIndicator )
	self.ChangedIndicator = ChangedIndicator
	
	local ChangedIndicatorCP = LUI.UIImage.new()
	ChangedIndicatorCP:setLeftRight( true, true, 0, 0 )
	ChangedIndicatorCP:setTopBottom( true, true, 0, 0 )
	ChangedIndicatorCP:setAlpha( 0 )
	ChangedIndicatorCP:setImage( RegisterImage( "uie_t7_menu_cac_icontoken_cp" ) )
	self:addElement( ChangedIndicatorCP )
	self.ChangedIndicatorCP = ChangedIndicatorCP
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				ChangedIndicator:completeAnimation()
				self.ChangedIndicator:setAlpha( 0 )
				self.clipFinished( ChangedIndicator, {} )
			end
		},
		Visible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				ChangedIndicator:completeAnimation()
				self.ChangedIndicator:setAlpha( 1 )
				self.clipFinished( ChangedIndicator, {} )
				ChangedIndicatorCP:completeAnimation()
				self.ChangedIndicatorCP:setAlpha( 0 )
				self.clipFinished( ChangedIndicatorCP, {} )
			end
		},
		VisibleCP = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				ChangedIndicator:completeAnimation()
				self.ChangedIndicator:setAlpha( 0 )
				self.clipFinished( ChangedIndicator, {} )
				ChangedIndicatorCP:completeAnimation()
				self.ChangedIndicatorCP:setAlpha( 1 )
				self.clipFinished( ChangedIndicatorCP, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				local f6_local0
				if not IsGametypeItemSettingDefault( element ) then
					f6_local0 = not IsCampaign()
				else
					f6_local0 = false
				end
				return f6_local0
			end
		},
		{
			stateName = "VisibleCP",
			condition = function ( menu, element, event )
				local f7_local0
				if not IsGametypeItemSettingDefault( element ) then
					f7_local0 = IsCampaign()
				else
					f7_local0 = false
				end
				return f7_local0
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "GametypeSettings.Update" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "GametypeSettings.Update"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNav"
		} )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

