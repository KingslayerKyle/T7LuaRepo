CoD.FR_BestTime = InheritFrom( LUI.UIElement )
CoD.FR_BestTime.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.FR_BestTime )
	self.id = "FR_BestTime"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 205 )
	self:setTopBottom( 0, 0, 0, 93 )
	
	local BestTimeBoxOrange = LUI.UIImage.new()
	BestTimeBoxOrange:setLeftRight( 0, 0, 6, 202 )
	BestTimeBoxOrange:setTopBottom( 0, 0, 0, 46 )
	BestTimeBoxOrange:setImage( RegisterImage( "uie_t7_freerun_hud_infobarright_besttimebox" ) )
	BestTimeBoxOrange:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( BestTimeBoxOrange )
	self.BestTimeBoxOrange = BestTimeBoxOrange
	
	local BestTimeBoxOrange0 = LUI.UIImage.new()
	BestTimeBoxOrange0:setLeftRight( 0, 0, 6, 202 )
	BestTimeBoxOrange0:setTopBottom( 0, 0, 0, 46 )
	BestTimeBoxOrange0:setAlpha( 0.3 )
	BestTimeBoxOrange0:setImage( RegisterImage( "uie_t7_freerun_hud_infobarright_besttimebox" ) )
	self:addElement( BestTimeBoxOrange0 )
	self.BestTimeBoxOrange0 = BestTimeBoxOrange0
	
	local BestTimeBox = LUI.UIImage.new()
	BestTimeBox:setLeftRight( 0, 0, 0, 206 )
	BestTimeBox:setTopBottom( 0, 0, 25, 94 )
	BestTimeBox:setRGB( 0, 0, 0 )
	BestTimeBox:setAlpha( 0.5 )
	BestTimeBox:setImage( RegisterImage( "uie_t7_freerun_hud_infobarright_besttimebottom" ) )
	self:addElement( BestTimeBox )
	self.BestTimeBox = BestTimeBox
	
	local BestTimeText = LUI.UIText.new()
	BestTimeText:setLeftRight( 0, 0, 18, 188 )
	BestTimeText:setTopBottom( 0, 0, 6, 39 )
	BestTimeText:setRGB( 0, 0, 0 )
	BestTimeText:setText( Engine.Localize( "MENU_BEST_TIME" ) )
	BestTimeText:setTTF( "fonts/escom.ttf" )
	BestTimeText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	BestTimeText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( BestTimeText )
	self.BestTimeText = BestTimeText
	
	local BestTimeValueText = LUI.UIText.new()
	BestTimeValueText:setLeftRight( 0, 0, 26, 178 )
	BestTimeValueText:setTopBottom( 0, 0, 39, 78 )
	BestTimeValueText:setText( Engine.Localize( "--:--:--" ) )
	BestTimeValueText:setTTF( "fonts/escom.ttf" )
	BestTimeValueText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	BestTimeValueText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( BestTimeValueText )
	self.BestTimeValueText = BestTimeValueText
	
	self.resetProperties = function ()
		BestTimeValueText:completeAnimation()
		BestTimeText:completeAnimation()
		BestTimeBox:completeAnimation()
		BestTimeBoxOrange:completeAnimation()
		BestTimeBoxOrange0:completeAnimation()
		BestTimeValueText:setAlpha( 1 )
		BestTimeText:setAlpha( 1 )
		BestTimeBox:setAlpha( 0.5 )
		BestTimeBoxOrange:setAlpha( 1 )
		BestTimeBoxOrange0:setAlpha( 0.3 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 5 )
				BestTimeBoxOrange:completeAnimation()
				self.BestTimeBoxOrange:setAlpha( 0 )
				self.clipFinished( BestTimeBoxOrange, {} )
				BestTimeBoxOrange0:completeAnimation()
				self.BestTimeBoxOrange0:setAlpha( 0 )
				self.clipFinished( BestTimeBoxOrange0, {} )
				BestTimeBox:completeAnimation()
				self.BestTimeBox:setAlpha( 0 )
				self.clipFinished( BestTimeBox, {} )
				BestTimeText:completeAnimation()
				self.BestTimeText:setAlpha( 0 )
				self.clipFinished( BestTimeText, {} )
				BestTimeValueText:completeAnimation()
				self.BestTimeValueText:setAlpha( 0 )
				self.clipFinished( BestTimeValueText, {} )
			end,
			FaultAnim = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		Visible = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return IsFreeRunLobby()
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNav"
		} )
	end )
	self:subscribeToGlobalModel( controller, "lobbyRoot", "lobbyNav", function ( model )
		local element = self
		UpdateState( self, event )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

