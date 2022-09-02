-- f177d577867ae49223b97ec25f4f460d
-- This hash is used for caching, delete to decompile the file again

CoD.Outcome_title_PnlLineInt = InheritFrom( LUI.UIElement )
CoD.Outcome_title_PnlLineInt.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.Outcome_title_PnlLineInt )
	self.id = "Outcome_title_PnlLineInt"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 23 )
	self:setTopBottom( true, false, 0, 4 )
	
	local LineBlur = LUI.UIImage.new()
	LineBlur:setLeftRight( false, false, -11.5, 11.5 )
	LineBlur:setTopBottom( false, false, -2, 2 )
	LineBlur:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_scene_blur_pass_1" ) )
	LineBlur:setShaderVector( 0, 0, 20, 0, 0 )
	self:addElement( LineBlur )
	self.LineBlur = LineBlur
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )

			end
		},
		VictoryGreen = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				LineBlur:completeAnimation()
				self.LineBlur:setRGB( 0.05, 1, 0 )
				self.LineBlur:setAlpha( 0.3 )
				self.clipFinished( LineBlur, {} )
			end
		},
		DefeatRed = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				LineBlur:completeAnimation()
				self.LineBlur:setRGB( 1, 0.01, 0 )
				self.LineBlur:setAlpha( 0.3 )
				self.clipFinished( LineBlur, {} )
			end
		},
		OvertimeOrange = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				LineBlur:completeAnimation()
				self.LineBlur:setRGB( 0, 0, 0 )
				self.LineBlur:setAlpha( 0.3 )
				self.clipFinished( LineBlur, {} )
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

