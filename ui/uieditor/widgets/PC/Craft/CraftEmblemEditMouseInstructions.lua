-- 7d2cab02f6a9628b51acc9e1084f7981
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactiveStroke" )
require( "ui.uieditor.widgets.Craft.Paintshop.PaintshopChooseSide" )

CoD.CraftEmblemEditMouseInstructions = InheritFrom( LUI.UIElement )
CoD.CraftEmblemEditMouseInstructions.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CraftEmblemEditMouseInstructions )
	self.id = "CraftEmblemEditMouseInstructions"
	self.soundSet = "CustomizationEditor"
	self:setLeftRight( true, false, 0, 250 )
	self:setTopBottom( true, false, 0, 80 )
	self.anyChildUsesUpdateState = true
	
	local fullBackground = LUI.UIImage.new()
	fullBackground:setLeftRight( true, true, 0, 0 )
	fullBackground:setTopBottom( true, true, 0, 0 )
	fullBackground:setRGB( 0, 0, 0 )
	fullBackground:setAlpha( 0.5 )
	self:addElement( fullBackground )
	self.fullBackground = fullBackground
	
	local borderOutline = CoD.cac_ButtonBoxLrgInactiveStroke.new( menu, controller )
	borderOutline:setLeftRight( true, true, -2, 2 )
	borderOutline:setTopBottom( true, true, -2, 2 )
	self:addElement( borderOutline )
	self.borderOutline = borderOutline
	
	local header = CoD.PaintshopChooseSide.new( menu, controller )
	header:setLeftRight( true, true, 0.45, 0 )
	header:setTopBottom( true, false, 1, 22 )
	header.text:setText( Engine.Localize( LocalizeToUpperString( "PLATFORM_MOUSE" ) ) )
	header.text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	self:addElement( header )
	self.header = header
	
	local translateInstruction = LUI.UIText.new()
	translateInstruction:setLeftRight( true, true, 5, -5 )
	translateInstruction:setTopBottom( true, false, 30, 50 )
	translateInstruction:setText( Engine.Localize( "PLATFORM_EMBLEM_MOVE_LAYER_KBM" ) )
	translateInstruction:setTTF( "fonts/default.ttf" )
	translateInstruction:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	translateInstruction:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( translateInstruction )
	self.translateInstruction = translateInstruction
	
	local scaleInstruction = LUI.UIText.new()
	scaleInstruction:setLeftRight( true, true, 5, -5 )
	scaleInstruction:setTopBottom( true, false, 54, 74 )
	scaleInstruction:setText( Engine.Localize( "PLATFORM_EMBLEM_SCALE_LAYER_KBM" ) )
	scaleInstruction:setTTF( "fonts/default.ttf" )
	scaleInstruction:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	scaleInstruction:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( scaleInstruction )
	self.scaleInstruction = scaleInstruction
	
	local materialScaleInstruction = LUI.UIText.new()
	materialScaleInstruction:setLeftRight( true, true, 5, -5 )
	materialScaleInstruction:setTopBottom( true, false, 30, 50 )
	materialScaleInstruction:setAlpha( 0 )
	materialScaleInstruction:setText( Engine.Localize( "PLATFORM_EMBLEM_MATERIAL_SCALE_KBM" ) )
	materialScaleInstruction:setTTF( "fonts/default.ttf" )
	materialScaleInstruction:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	materialScaleInstruction:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( materialScaleInstruction )
	self.materialScaleInstruction = materialScaleInstruction
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				fullBackground:completeAnimation()
				self.fullBackground:setAlpha( 0.5 )
				self.clipFinished( fullBackground, {} )
				borderOutline:completeAnimation()
				self.borderOutline:setAlpha( 1 )
				self.clipFinished( borderOutline, {} )
				header:completeAnimation()
				self.header:setAlpha( 1 )
				self.clipFinished( header, {} )
				translateInstruction:completeAnimation()
				self.translateInstruction:setAlpha( 1 )
				self.clipFinished( translateInstruction, {} )
				scaleInstruction:completeAnimation()
				self.scaleInstruction:setAlpha( 1 )
				self.clipFinished( scaleInstruction, {} )
				materialScaleInstruction:completeAnimation()
				self.materialScaleInstruction:setAlpha( 0 )
				self.clipFinished( materialScaleInstruction, {} )
			end
		},
		MaterialScale = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				fullBackground:completeAnimation()
				self.fullBackground:setAlpha( 0.5 )
				self.clipFinished( fullBackground, {} )
				borderOutline:completeAnimation()
				self.borderOutline:setAlpha( 1 )
				self.clipFinished( borderOutline, {} )
				header:completeAnimation()
				self.header:setAlpha( 1 )
				self.clipFinished( header, {} )
				translateInstruction:completeAnimation()
				self.translateInstruction:setAlpha( 0 )
				self.clipFinished( translateInstruction, {} )
				scaleInstruction:completeAnimation()
				self.scaleInstruction:setAlpha( 0 )
				self.clipFinished( scaleInstruction, {} )
				materialScaleInstruction:completeAnimation()
				self.materialScaleInstruction:setAlpha( 1 )
				self.clipFinished( materialScaleInstruction, {} )
			end
		},
		Hidden = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				fullBackground:completeAnimation()
				self.fullBackground:setAlpha( 0 )
				self.clipFinished( fullBackground, {} )
				borderOutline:completeAnimation()
				self.borderOutline:setAlpha( 0 )
				self.clipFinished( borderOutline, {} )
				header:completeAnimation()
				self.header:setAlpha( 0 )
				self.clipFinished( header, {} )
				translateInstruction:completeAnimation()
				self.translateInstruction:setAlpha( 0 )
				self.clipFinished( translateInstruction, {} )
				scaleInstruction:completeAnimation()
				self.scaleInstruction:setAlpha( 0 )
				self.clipFinished( scaleInstruction, {} )
				materialScaleInstruction:completeAnimation()
				self.materialScaleInstruction:setAlpha( 0 )
				self.clipFinished( materialScaleInstruction, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.borderOutline:close()
		element.header:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

