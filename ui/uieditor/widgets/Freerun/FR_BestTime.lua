-- 68cbd2c4008e8860adabcb541063c742
-- This hash is used for caching, delete to decompile the file again

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
	self:setLeftRight( true, false, 0, 137 )
	self:setTopBottom( true, false, 0, 62 )
	
	local BestTimeBoxOrange = LUI.UIImage.new()
	BestTimeBoxOrange:setLeftRight( true, false, 4, 134.87 )
	BestTimeBoxOrange:setTopBottom( true, false, 0, 30.79 )
	BestTimeBoxOrange:setImage( RegisterImage( "uie_t7_freerun_hud_infobarright_besttimebox" ) )
	BestTimeBoxOrange:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( BestTimeBoxOrange )
	self.BestTimeBoxOrange = BestTimeBoxOrange
	
	local BestTimeBoxOrange0 = LUI.UIImage.new()
	BestTimeBoxOrange0:setLeftRight( true, false, 4, 134.87 )
	BestTimeBoxOrange0:setTopBottom( true, false, 0, 30.79 )
	BestTimeBoxOrange0:setAlpha( 0.3 )
	BestTimeBoxOrange0:setImage( RegisterImage( "uie_t7_freerun_hud_infobarright_besttimebox" ) )
	self:addElement( BestTimeBoxOrange0 )
	self.BestTimeBoxOrange0 = BestTimeBoxOrange0
	
	local BestTimeBox = LUI.UIImage.new()
	BestTimeBox:setLeftRight( true, false, 0, 137.53 )
	BestTimeBox:setTopBottom( true, false, 16.55, 62.4 )
	BestTimeBox:setRGB( 0, 0, 0 )
	BestTimeBox:setAlpha( 0.5 )
	BestTimeBox:setImage( RegisterImage( "uie_t7_freerun_hud_infobarright_besttimebottom" ) )
	self:addElement( BestTimeBox )
	self.BestTimeBox = BestTimeBox
	
	local BestTimeText = LUI.UIText.new()
	BestTimeText:setLeftRight( true, false, 12, 125 )
	BestTimeText:setTopBottom( true, false, 3.79, 25.79 )
	BestTimeText:setRGB( 0, 0, 0 )
	BestTimeText:setText( Engine.Localize( "MENU_BEST_TIME" ) )
	BestTimeText:setTTF( "fonts/escom.ttf" )
	BestTimeText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	BestTimeText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( BestTimeText )
	self.BestTimeText = BestTimeText
	
	local BestTimeValueText = LUI.UIText.new()
	BestTimeValueText:setLeftRight( true, false, 16.94, 118.59 )
	BestTimeValueText:setTopBottom( true, false, 25.79, 51.79 )
	BestTimeValueText:setText( Engine.Localize( "--:--:--" ) )
	BestTimeValueText:setTTF( "fonts/escom.ttf" )
	BestTimeValueText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	BestTimeValueText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( BestTimeValueText )
	self.BestTimeValueText = BestTimeValueText
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
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
				self.BestTimeText:setText( Engine.Localize( "MENU_BEST_TIME" ) )
				self.clipFinished( BestTimeText, {} )
				BestTimeValueText:completeAnimation()
				self.BestTimeValueText:setAlpha( 0 )
				self.clipFinished( BestTimeValueText, {} )
			end,
			FaultAnim = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		Visible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				BestTimeBoxOrange:completeAnimation()
				self.BestTimeBoxOrange:setAlpha( 1 )
				self.clipFinished( BestTimeBoxOrange, {} )
				BestTimeBoxOrange0:completeAnimation()
				self.BestTimeBoxOrange0:setAlpha( 0.3 )
				self.clipFinished( BestTimeBoxOrange0, {} )
				BestTimeBox:completeAnimation()
				self.BestTimeBox:setAlpha( 0.5 )
				self.clipFinished( BestTimeBox, {} )
				BestTimeText:completeAnimation()
				self.BestTimeText:setAlpha( 1 )
				self.clipFinished( BestTimeText, {} )
				BestTimeValueText:completeAnimation()
				self.BestTimeValueText:setAlpha( 1 )
				self.clipFinished( BestTimeValueText, {} )
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
		local f7_local0 = self
		UpdateState( self, event )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

