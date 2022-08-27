-- 28000f2e299bc33f856f55afd7f73972
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Freerun.freerun_InfoBoxBlur" )
require( "ui.uieditor.widgets.Freerun.FR_BestTimeHud" )
require( "ui.uieditor.widgets.Freerun.FR_FaultsNumberBox" )
require( "ui.uieditor.widgets.Freerun.FR_RetriesNumbersBox" )

CoD.FR_InfoWidget = InheritFrom( LUI.UIElement )
CoD.FR_InfoWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.FR_InfoWidget )
	self.id = "FR_InfoWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 316 )
	self:setTopBottom( true, false, 0, 206 )
	self.anyChildUsesUpdateState = true
	
	local freerunInfoBoxBlur = CoD.freerun_InfoBoxBlur.new( menu, controller )
	freerunInfoBoxBlur:setLeftRight( true, false, 24, 230 )
	freerunInfoBoxBlur:setTopBottom( true, false, 0, 206 )
	freerunInfoBoxBlur:setRGB( 0.73, 0.73, 0.73 )
	self:addElement( freerunInfoBoxBlur )
	self.freerunInfoBoxBlur = freerunInfoBoxBlur
	
	local Box1 = LUI.UIImage.new()
	Box1:setLeftRight( true, false, 27.25, 210 )
	Box1:setTopBottom( true, false, 65.16, 101.87 )
	Box1:setRGB( 0, 0, 0 )
	Box1:setAlpha( 0.2 )
	Box1:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_edges" ) )
	Box1:setShaderVector( 0, 0.02, 0.02, 0.02, 0.02 )
	self:addElement( Box1 )
	self.Box1 = Box1
	
	local Box2 = LUI.UIImage.new()
	Box2:setLeftRight( true, false, 27.25, 210 )
	Box2:setTopBottom( true, false, 103.16, 139.87 )
	Box2:setRGB( 0, 0, 0 )
	Box2:setAlpha( 0.2 )
	Box2:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_edges" ) )
	Box2:setShaderVector( 0, 0.02, 0.02, 0.02, 0.02 )
	self:addElement( Box2 )
	self.Box2 = Box2
	
	local FaultsTextBox = LUI.UIText.new()
	FaultsTextBox:setLeftRight( true, false, 93.74, 200.99 )
	FaultsTextBox:setTopBottom( true, false, 74, 96 )
	FaultsTextBox:setText( Engine.Localize( "MENU_LB_FAULTS" ) )
	FaultsTextBox:setTTF( "fonts/escom.ttf" )
	FaultsTextBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	FaultsTextBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( FaultsTextBox )
	self.FaultsTextBox = FaultsTextBox
	
	local InfoLineBoxBottom = LUI.UIImage.new()
	InfoLineBoxBottom:setLeftRight( true, true, 23, -96.74 )
	InfoLineBoxBottom:setTopBottom( true, true, 133.29, -61.06 )
	InfoLineBoxBottom:setAlpha( 0.3 )
	InfoLineBoxBottom:setImage( RegisterImage( "uie_t7_freerun_hud_infobarright_line" ) )
	InfoLineBoxBottom:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( InfoLineBoxBottom )
	self.InfoLineBoxBottom = InfoLineBoxBottom
	
	local InfoBoxLineTop = LUI.UIImage.new()
	InfoBoxLineTop:setLeftRight( true, true, 23, -96.74 )
	InfoBoxLineTop:setTopBottom( true, true, 0.2, -194.15 )
	InfoBoxLineTop:setAlpha( 0.3 )
	InfoBoxLineTop:setImage( RegisterImage( "uie_t7_freerun_hud_infobarright_line" ) )
	InfoBoxLineTop:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( InfoBoxLineTop )
	self.InfoBoxLineTop = InfoBoxLineTop
	
	local InfoBoxLineMiddle = LUI.UIImage.new()
	InfoBoxLineMiddle:setLeftRight( true, true, 24, -95.74 )
	InfoBoxLineMiddle:setTopBottom( true, true, 58.58, -135.76 )
	InfoBoxLineMiddle:setAlpha( 0.3 )
	InfoBoxLineMiddle:setImage( RegisterImage( "uie_t7_freerun_hud_infobarright_line" ) )
	InfoBoxLineMiddle:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( InfoBoxLineMiddle )
	self.InfoBoxLineMiddle = InfoBoxLineMiddle
	
	local SideElement1 = LUI.UIImage.new()
	SideElement1:setLeftRight( true, false, 0, 36 )
	SideElement1:setTopBottom( false, false, -98.73, -95.23 )
	SideElement1:setZRot( 180 )
	SideElement1:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	SideElement1:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( SideElement1 )
	self.SideElement1 = SideElement1
	
	local SideElement2 = LUI.UIImage.new()
	SideElement2:setLeftRight( true, false, 0, 36 )
	SideElement2:setTopBottom( false, false, -40.34, -36.84 )
	SideElement2:setZRot( 180 )
	SideElement2:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	SideElement2:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( SideElement2 )
	self.SideElement2 = SideElement2
	
	local SideElement3 = LUI.UIImage.new()
	SideElement3:setLeftRight( true, false, 0, 36 )
	SideElement3:setTopBottom( false, false, 34.37, 37.87 )
	SideElement3:setZRot( 180 )
	SideElement3:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	SideElement3:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( SideElement3 )
	self.SideElement3 = SideElement3
	
	local FRBestTimeHud = CoD.FR_BestTimeHud.new( menu, controller )
	FRBestTimeHud:setLeftRight( true, false, 20, 221 )
	FRBestTimeHud:setTopBottom( true, false, 1.27, 63.66 )
	FRBestTimeHud:linkToElementModel( self, nil, false, function ( model )
		FRBestTimeHud:setModel( model, controller )
	end )
	self:addElement( FRBestTimeHud )
	self.FRBestTimeHud = FRBestTimeHud
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, false, 204, 240 )
	Image0:setTopBottom( false, false, -98.73, -95.23 )
	Image0:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local Image1 = LUI.UIImage.new()
	Image1:setLeftRight( true, false, 204, 240 )
	Image1:setTopBottom( false, false, -39.34, -35.84 )
	Image1:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image1:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( Image1 )
	self.Image1 = Image1
	
	local Image2 = LUI.UIImage.new()
	Image2:setLeftRight( true, false, 204, 240 )
	Image2:setTopBottom( false, false, 35.09, 38.59 )
	Image2:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image2:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( Image2 )
	self.Image2 = Image2
	
	local RetriesText = LUI.UIText.new()
	RetriesText:setLeftRight( true, false, 93.74, 200.99 )
	RetriesText:setTopBottom( true, false, 109.51, 131.51 )
	RetriesText:setText( Engine.Localize( "MENU_FR_RETRIES" ) )
	RetriesText:setTTF( "fonts/escom.ttf" )
	RetriesText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	RetriesText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( RetriesText )
	self.RetriesText = RetriesText
	
	local FRFaultsNumberBox = CoD.FR_FaultsNumberBox.new( menu, controller )
	FRFaultsNumberBox:setLeftRight( true, false, 27.25, 77.74 )
	FRFaultsNumberBox:setTopBottom( true, false, 65.16, 101.87 )
	FRFaultsNumberBox:linkToElementModel( self, "faults", true, function ( model )
		local faults = Engine.GetModelValue( model )
		if faults then
			FRFaultsNumberBox.FaultsNumber:setText( Engine.Localize( faults ) )
		end
	end )
	self:addElement( FRFaultsNumberBox )
	self.FRFaultsNumberBox = FRFaultsNumberBox
	
	local FRRetriesNumbersBox = CoD.FR_RetriesNumbersBox.new( menu, controller )
	FRRetriesNumbersBox:setLeftRight( true, false, 27.25, 77.74 )
	FRRetriesNumbersBox:setTopBottom( true, false, 103.16, 139.87 )
	FRRetriesNumbersBox:linkToElementModel( self, "retries", true, function ( model )
		local retries = Engine.GetModelValue( model )
		if retries then
			FRRetriesNumbersBox.RetriesNumber:setText( Engine.Localize( retries ) )
		end
	end )
	self:addElement( FRRetriesNumbersBox )
	self.FRRetriesNumbersBox = FRRetriesNumbersBox
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			FaultAnim = function ()
				self:setupElementClipCounter( 1 )
				local FaultsTextBoxFrame2 = function ( FaultsTextBox, event )
					local FaultsTextBoxFrame3 = function ( FaultsTextBox, event )
						if not event.interrupted then
							FaultsTextBox:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						end
						FaultsTextBox:setRGB( 1, 1, 1 )
						if event.interrupted then
							self.clipFinished( FaultsTextBox, event )
						else
							FaultsTextBox:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						FaultsTextBoxFrame3( FaultsTextBox, event )
						return 
					else
						FaultsTextBox:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						FaultsTextBox:setRGB( 1, 0, 0 )
						FaultsTextBox:registerEventHandler( "transition_complete_keyframe", FaultsTextBoxFrame3 )
					end
				end
				
				FaultsTextBox:completeAnimation()
				self.FaultsTextBox:setRGB( 1, 1, 1 )
				FaultsTextBoxFrame2( FaultsTextBox, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.freerunInfoBoxBlur:close()
		element.FRBestTimeHud:close()
		element.FRFaultsNumberBox:close()
		element.FRRetriesNumbersBox:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

