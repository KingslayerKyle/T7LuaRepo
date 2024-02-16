-- 39ebb410acebdb43130461a5fa1c2b62
-- This hash is used for caching, delete to decompile the file again

CoD.ScoreboardRowDeathIconWidget = InheritFrom( LUI.UIElement )
CoD.ScoreboardRowDeathIconWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.ScoreboardRowDeathIconWidget )
	self.id = "ScoreboardRowDeathIconWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 23 )
	self:setTopBottom( true, false, 0, 23 )
	
	local ImDeadIcon = LUI.UIImage.new()
	ImDeadIcon:setLeftRight( true, false, 0, 23 )
	ImDeadIcon:setTopBottom( true, false, 0, 23 )
	ImDeadIcon:setAlpha( 0 )
	ImDeadIcon:setImage( RegisterImage( "uie_t7_icon_aar_death" ) )
	self:addElement( ImDeadIcon )
	self.ImDeadIcon = ImDeadIcon
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				ImDeadIcon:completeAnimation()
				self.ImDeadIcon:setAlpha( 0 )
				self.clipFinished( ImDeadIcon, {} )
			end
		},
		Dead = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				ImDeadIcon:completeAnimation()
				self.ImDeadIcon:setAlpha( 1 )
				self.clipFinished( ImDeadIcon, {} )
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
