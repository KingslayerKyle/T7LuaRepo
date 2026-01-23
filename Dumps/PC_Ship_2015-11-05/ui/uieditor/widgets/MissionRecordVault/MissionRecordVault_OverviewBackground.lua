CoD.MissionRecordVault_OverviewBackground = InheritFrom( LUI.UIElement )
CoD.MissionRecordVault_OverviewBackground.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.MissionRecordVault_OverviewBackground )
	self.id = "MissionRecordVault_OverviewBackground"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 556 )
	
	local backgroundMid = LUI.UIImage.new()
	backgroundMid:setLeftRight( true, true, 0, 0 )
	backgroundMid:setTopBottom( true, true, 0, 0 )
	backgroundMid:setRGB( 0, 0, 0 )
	backgroundMid:setAlpha( 0 )
	self:addElement( backgroundMid )
	self.backgroundMid = backgroundMid
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				backgroundMid:completeAnimation()
				self.backgroundMid:setAlpha( 0.5 )
				self.clipFinished( backgroundMid, {} )
			end
		},
		Hidden = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				backgroundMid:completeAnimation()
				self.backgroundMid:setAlpha( 0 )
				self.clipFinished( backgroundMid, {} )
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

