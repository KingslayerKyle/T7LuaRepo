-- 669f4f8a8abe0ab903ec1eb262a5c0af
-- This hash is used for caching, delete to decompile the file again

CoD.CP_Prologue_FaceScanner_Flipbook = InheritFrom( LUI.UIElement )
CoD.CP_Prologue_FaceScanner_Flipbook.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.CP_Prologue_FaceScanner_Flipbook )
	self.id = "CP_Prologue_FaceScanner_Flipbook"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 192 )
	self:setTopBottom( true, false, 0, 240 )
	
	local BackGlow = LUI.UIImage.new()
	BackGlow:setLeftRight( false, false, -96, 96 )
	BackGlow:setTopBottom( false, false, -120, 120 )
	BackGlow:setRGB( 0, 0, 0 )
	BackGlow:setAlpha( 0.4 )
	BackGlow:setScale( 1.6 )
	BackGlow:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	self:addElement( BackGlow )
	self.BackGlow = BackGlow
	
	local PrologueFlipbok = LUI.UIImage.new()
	PrologueFlipbok:setLeftRight( true, false, 0, 192 )
	PrologueFlipbok:setTopBottom( true, false, 0, 240 )
	PrologueFlipbok:setAlpha( 0.9 )
	PrologueFlipbok:setImage( RegisterImage( "uie_t7_hud_cp_facescan_flipbook" ) )
	PrologueFlipbok:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_flipbook_add" ) )
	PrologueFlipbok:setShaderVector( 0, 10, 6, 0, 0 )
	PrologueFlipbok:setShaderVector( 1, 6, 0, 0, 0 )
	PrologueFlipbok:setupUIStreamedImage( 0 )
	self:addElement( PrologueFlipbok )
	self.PrologueFlipbok = PrologueFlipbok
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

