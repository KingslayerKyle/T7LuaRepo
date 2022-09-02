-- d7db9e97e45e7c83bf9d8e8bfa2e9c5d
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.HUD.ScoreInfo.ScoreInfo_PanelScale" )

CoD.ScrStk_PanelContainer = InheritFrom( LUI.UIElement )
CoD.ScrStk_PanelContainer.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.ScrStk_PanelContainer )
	self.id = "ScrStk_PanelContainer"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 61 )
	self:setTopBottom( true, false, 0, 166 )
	self.anyChildUsesUpdateState = true
	
	local Panel = CoD.ScoreInfo_PanelScale.new( menu, controller )
	Panel:setLeftRight( false, false, -30.5, 30.5 )
	Panel:setTopBottom( false, false, -86, 83 )
	Panel:setRGB( 0.55, 0.58, 0.6 )
	self:addElement( Panel )
	self.Panel = Panel
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				Panel:completeAnimation()
				self.Panel:setLeftRight( false, false, -30.5, 30.5 )
				self.Panel:setTopBottom( false, false, 40, 83 )
				self.clipFinished( Panel, {} )
			end
		},
		Scr2 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				Panel:completeAnimation()
				self.Panel:setLeftRight( false, false, -30.5, 30.5 )
				self.Panel:setTopBottom( false, false, -2, 83 )
				self.clipFinished( Panel, {} )
			end
		},
		Scr3 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				Panel:completeAnimation()
				self.Panel:setLeftRight( false, false, -30.5, 30.5 )
				self.Panel:setTopBottom( false, false, -44, 83 )
				self.clipFinished( Panel, {} )
			end
		},
		Scr4 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				Panel:completeAnimation()
				self.Panel:setLeftRight( false, false, -30.5, 30.5 )
				self.Panel:setTopBottom( false, false, -83, 83 )
				self.clipFinished( Panel, {} )
			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Panel:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

