require( "ui.uieditor.widgets.StartMenu.StartMenu_frame_noBG" )

CoD.EmblemEditorFrame = InheritFrom( LUI.UIElement )
CoD.EmblemEditorFrame.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.EmblemEditorFrame )
	self.id = "EmblemEditorFrame"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( true, false, 0, 134 )
	self:setTopBottom( true, false, 0, 129 )
	self.anyChildUsesUpdateState = true
	
	local StartMenuframenoBG0 = CoD.StartMenu_frame_noBG.new( menu, controller )
	StartMenuframenoBG0:setLeftRight( true, true, 0, 0 )
	StartMenuframenoBG0:setTopBottom( true, true, 0, 0 )
	StartMenuframenoBG0:setRGB( 1, 1, 1 )
	self:addElement( StartMenuframenoBG0 )
	self.StartMenuframenoBG0 = StartMenuframenoBG0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		Disabled = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	self.close = function ( self )
		self.StartMenuframenoBG0:close()
		CoD.EmblemEditorFrame.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

