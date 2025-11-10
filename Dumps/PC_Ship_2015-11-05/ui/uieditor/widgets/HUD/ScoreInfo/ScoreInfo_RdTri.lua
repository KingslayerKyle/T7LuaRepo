CoD.ScoreInfo_RdTri = InheritFrom( LUI.UIElement )
CoD.ScoreInfo_RdTri.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ScoreInfo_RdTri )
	self.id = "ScoreInfo_RdTri"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 8 )
	self:setTopBottom( true, false, 0, 8 )
	
	local TriLine = LUI.UIImage.new()
	TriLine:setLeftRight( true, false, 0, 8 )
	TriLine:setTopBottom( true, false, 0, 8 )
	TriLine:setAlpha( 0.5 )
	TriLine:setImage( RegisterImage( "uie_t7_core_hud_scorewidget_rdtriline" ) )
	self:addElement( TriLine )
	self.TriLine = TriLine
	
	local TriFill = LUI.UIImage.new()
	TriFill:setLeftRight( true, false, 0, 8 )
	TriFill:setTopBottom( true, false, 0, 8 )
	TriFill:setImage( RegisterImage( "uie_t7_core_hud_scorewidget_rdtrifill" ) )
	self:addElement( TriFill )
	self.TriFill = TriFill
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				TriFill:completeAnimation()
				self.TriFill:setAlpha( 0 )
				self.clipFinished( TriFill, {} )
			end
		},
		Active = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				TriFill:completeAnimation()
				self.TriFill:setAlpha( 1 )
				self.clipFinished( TriFill, {} )
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

