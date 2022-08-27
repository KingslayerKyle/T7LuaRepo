-- 5c7930e1aca9398cf6c6a8c09ef6dec4
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.CAC.cac_ItemTitleGlow" )

CoD.MediaManager_BuyExtraSlots = InheritFrom( LUI.UIElement )
CoD.MediaManager_BuyExtraSlots.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.MediaManager_BuyExtraSlots )
	self.id = "MediaManager_BuyExtraSlots"
	self.soundSet = "Paintshop"
	self:setLeftRight( true, false, 0, 350 )
	self:setTopBottom( true, false, 0, 180 )
	
	local BG = LUI.UIImage.new()
	BG:setLeftRight( true, false, 0, 350 )
	BG:setTopBottom( true, false, 0, 180 )
	BG:setRGB( 0, 0, 0 )
	BG:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_edges" ) )
	BG:setShaderVector( 0, 0.01, 0.01, 0.01, 0.01 )
	self:addElement( BG )
	self.BG = BG
	
	local HeaderBG = CoD.cac_ItemTitleGlow.new( menu, controller )
	HeaderBG:setLeftRight( true, false, 349, 1 )
	HeaderBG:setTopBottom( true, false, 14, 50 )
	HeaderBG:setRGB( 0.9, 0.9, 0.9 )
	self:addElement( HeaderBG )
	self.HeaderBG = HeaderBG
	
	local HeaderLabel = LUI.UITightText.new()
	HeaderLabel:setLeftRight( true, false, 14.5, 363 )
	HeaderLabel:setTopBottom( true, false, 17, 47 )
	HeaderLabel:setRGB( 0, 0, 0 )
	HeaderLabel:setText( Engine.Localize( "MENU_FILESHARE_BUY_SLOTS" ) )
	HeaderLabel:setTTF( "fonts/escom.ttf" )
	HeaderLabel:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	HeaderLabel:setShaderVector( 0, 0.06, 0, 0, 0 )
	HeaderLabel:setShaderVector( 1, 0.02, 0, 0, 0 )
	HeaderLabel:setShaderVector( 2, 1, 0, 0, 0 )
	self:addElement( HeaderLabel )
	self.HeaderLabel = HeaderLabel
	
	local BuyMoreDesc = LUI.UIText.new()
	BuyMoreDesc:setLeftRight( true, false, 17.5, 329.5 )
	BuyMoreDesc:setTopBottom( true, false, 58.5, 77.5 )
	BuyMoreDesc:setAlpha( 0.8 )
	BuyMoreDesc:setText( Engine.Localize( "MENU_FILESHARE_BUY_SLOTS_DESC" ) )
	BuyMoreDesc:setTTF( "fonts/default.ttf" )
	BuyMoreDesc:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	BuyMoreDesc:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( BuyMoreDesc )
	self.BuyMoreDesc = BuyMoreDesc
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				BG:completeAnimation()
				self.BG:setAlpha( 0 )
				self.clipFinished( BG, {} )
				HeaderBG:completeAnimation()
				self.HeaderBG:setAlpha( 0 )
				self.clipFinished( HeaderBG, {} )
				HeaderLabel:completeAnimation()
				self.HeaderLabel:setAlpha( 0 )
				self.clipFinished( HeaderLabel, {} )
				BuyMoreDesc:completeAnimation()
				self.BuyMoreDesc:setAlpha( 0 )
				self.clipFinished( BuyMoreDesc, {} )
			end
		},
		Visible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				BG:completeAnimation()
				self.BG:setAlpha( 1 )
				self.clipFinished( BG, {} )
				HeaderBG:completeAnimation()
				self.HeaderBG:setAlpha( 1 )
				self.clipFinished( HeaderBG, {} )
				HeaderLabel:completeAnimation()
				self.HeaderLabel:setAlpha( 1 )
				self.clipFinished( HeaderLabel, {} )
				BuyMoreDesc:completeAnimation()
				self.BuyMoreDesc:setAlpha( 0.8 )
				self.clipFinished( BuyMoreDesc, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return MediaManagerIsBuyMoreSlot()
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "MediaManager.isBuyMoreSlot" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "MediaManager.isBuyMoreSlot"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.HeaderBG:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

