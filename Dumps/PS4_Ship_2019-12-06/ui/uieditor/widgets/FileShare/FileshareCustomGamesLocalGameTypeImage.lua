require( "ui.uieditor.widgets.BorderBakedBlur" )
require( "ui.uieditor.widgets.BorderBakedSolid" )

CoD.FileshareCustomGamesLocalGameTypeImage = InheritFrom( LUI.UIElement )
CoD.FileshareCustomGamesLocalGameTypeImage.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.FileshareCustomGamesLocalGameTypeImage )
	self.id = "FileshareCustomGamesLocalGameTypeImage"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( true, false, 0, 500 )
	self:setTopBottom( true, false, 0, 300 )
	
	local LocalGameTypeImage = LUI.UIImage.new()
	LocalGameTypeImage:setLeftRight( true, true, 100, -100 )
	LocalGameTypeImage:setTopBottom( true, true, 0, 0 )
	self:addElement( LocalGameTypeImage )
	self.LocalGameTypeImage = LocalGameTypeImage
	
	local BorderBakedBlur = CoD.BorderBakedBlur.new( menu, controller )
	BorderBakedBlur:setLeftRight( true, true, 0, 0 )
	BorderBakedBlur:setTopBottom( true, true, 0, 0 )
	BorderBakedBlur:setAlpha( 0.4 )
	self:addElement( BorderBakedBlur )
	self.BorderBakedBlur = BorderBakedBlur
	
	local BorderBakedSolid = CoD.BorderBakedSolid.new( menu, controller )
	BorderBakedSolid:setLeftRight( true, true, 0, 0 )
	BorderBakedSolid:setTopBottom( true, true, 0, 0 )
	BorderBakedSolid:setAlpha( 0.5 )
	self:addElement( BorderBakedSolid )
	self.BorderBakedSolid = BorderBakedSolid
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				LocalGameTypeImage:completeAnimation()
				self.LocalGameTypeImage:setAlpha( 1 )
				self.clipFinished( LocalGameTypeImage, {} )
				BorderBakedBlur:completeAnimation()
				self.BorderBakedBlur:setAlpha( 0.4 )
				self.clipFinished( BorderBakedBlur, {} )
				BorderBakedSolid:completeAnimation()
				self.BorderBakedSolid:setAlpha( 0.5 )
				self.clipFinished( BorderBakedSolid, {} )
			end
		},
		Hidden = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				LocalGameTypeImage:completeAnimation()
				self.LocalGameTypeImage:setAlpha( 0 )
				self.clipFinished( LocalGameTypeImage, {} )
				BorderBakedBlur:completeAnimation()
				self.BorderBakedBlur:setAlpha( 0 )
				self.clipFinished( BorderBakedBlur, {} )
				BorderBakedSolid:completeAnimation()
				self.BorderBakedSolid:setAlpha( 0 )
				self.clipFinished( BorderBakedSolid, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.BorderBakedBlur:close()
		element.BorderBakedSolid:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

