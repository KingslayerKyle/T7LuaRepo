-- 484d295bae5a861b65c7fcfd2c10e492
-- This hash is used for caching, delete to decompile the file again

CoD.TrainingSim_CombatImmersionBox = InheritFrom( LUI.UIElement )
CoD.TrainingSim_CombatImmersionBox.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.TrainingSim_CombatImmersionBox )
	self.id = "TrainingSim_CombatImmersionBox"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 529 )
	self:setTopBottom( true, false, 0, 24 )
	
	local BlackBox = LUI.UIImage.new()
	BlackBox:setLeftRight( true, true, 529, -529 )
	BlackBox:setTopBottom( true, true, 0, 0 )
	BlackBox:setRGB( 0, 0, 0 )
	BlackBox:setAlpha( 0.6 )
	self:addElement( BlackBox )
	self.BlackBox = BlackBox
	
	local txtSimComplete10 = LUI.UIText.new()
	txtSimComplete10:setLeftRight( true, true, 0, 0 )
	txtSimComplete10:setTopBottom( true, false, 2, 22 )
	txtSimComplete10:setText( Engine.Localize( "CP_SH_CAIRO_TRAINING_SIM_COMPLETE_1" ) )
	txtSimComplete10:setTTF( "fonts/escom.ttf" )
	txtSimComplete10:setLetterSpacing( 4 )
	txtSimComplete10:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	txtSimComplete10:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( txtSimComplete10 )
	self.txtSimComplete10 = txtSimComplete10
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )

			end,
			round_complete = function ()
				self:setupElementClipCounter( 0 )

			end,
			immersion_complete = function ()
				self:setupElementClipCounter( 0 )

			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

