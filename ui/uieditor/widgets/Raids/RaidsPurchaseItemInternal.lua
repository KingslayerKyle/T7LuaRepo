-- d4aa63fdcebe7d389c5409a9c7892e55
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Border" )

CoD.RaidsPurchaseItemInternal = InheritFrom( LUI.UIElement )
CoD.RaidsPurchaseItemInternal.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( true )
	self:setClass( CoD.RaidsPurchaseItemInternal )
	self.id = "RaidsPurchaseItemInternal"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 96 )
	self:setTopBottom( true, false, 0, 96 )
	
	local Background = LUI.UIImage.new()
	Background:setLeftRight( true, true, 2, -2 )
	Background:setTopBottom( true, true, 2, -2 )
	Background:setRGB( 0.3, 0.3, 0.3 )
	self:addElement( Background )
	self.Background = Background
	
	local Image = LUI.UIImage.new()
	Image:setLeftRight( true, true, 5, -5 )
	Image:setTopBottom( true, true, 5, -5 )
	self:addElement( Image )
	self.Image = Image
	
	local CostBackground = LUI.UIImage.new()
	CostBackground:setLeftRight( true, true, 2, -2 )
	CostBackground:setTopBottom( false, true, -22, -2 )
	CostBackground:setRGB( 0.3, 0.3, 0.3 )
	self:addElement( CostBackground )
	self.CostBackground = CostBackground
	
	local Cost = LUI.UITightText.new()
	Cost:setLeftRight( true, true, 34.5, -34.5 )
	Cost:setTopBottom( false, true, -24, -2 )
	Cost:setText( Engine.Localize( "MENU_NEW" ) )
	Cost:setTTF( "fonts/default.ttf" )
	self:addElement( Cost )
	self.Cost = Cost
	
	local Highlight = CoD.Border.new( menu, controller )
	Highlight:setLeftRight( true, true, 0, 0 )
	Highlight:setTopBottom( true, true, 0, 0 )
	Highlight:setRGB( 1, 0.64, 0 )
	self:addElement( Highlight )
	self.Highlight = Highlight
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				Image:completeAnimation()
				self.Image:setAlpha( 1 )
				self.clipFinished( Image, {} )

				Cost:completeAnimation()
				self.Cost:setRGB( 1, 1, 1 )
				self.clipFinished( Cost, {} )
			end
		},
		Unavailable = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				Image:completeAnimation()
				self.Image:setAlpha( 0.5 )
				self.clipFinished( Image, {} )

				Cost:completeAnimation()
				self.Cost:setRGB( 0.4, 0.4, 0.4 )
				self.clipFinished( Cost, {} )
			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Highlight:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
