-- 98fd07ea088cdd0ee8d07744c83b84f2
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.HUD.ScoreInfo.ScoreInfo_TimeSemi" )
require( "ui.uieditor.widgets.HUD.core_AmmoWidget.AmmoWidget_BackLine" )

CoD.TrainingSim_TimerLines = InheritFrom( LUI.UIElement )
CoD.TrainingSim_TimerLines.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.TrainingSim_TimerLines )
	self.id = "TrainingSim_TimerLines"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 75 )
	self:setTopBottom( true, false, 0, 112 )
	
	local Semi = CoD.ScoreInfo_TimeSemi.new( menu, controller )
	Semi:setLeftRight( false, false, -10.5, 10.5 )
	Semi:setTopBottom( false, false, -58.84, 14.67 )
	Semi:setAlpha( 0.6 )
	Semi:setZRot( 90 )
	Semi:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	Semi:setShaderVector( 0, 0.05, 0.5, 0, 0 )
	Semi:setShaderVector( 1, 2, 0, 0, 0 )
	Semi:setShaderVector( 2, -0.2, -0.2, 0, 0 )
	Semi:setShaderVector( 3, 0, 0, 0, 0 )
	Semi:setShaderVector( 4, 0, 0, 0, 0 )
	self:addElement( Semi )
	self.Semi = Semi
	
	local Line1 = CoD.AmmoWidget_BackLine.new( menu, controller )
	Line1:setLeftRight( false, false, -66.5, 2.5 )
	Line1:setTopBottom( false, false, 17.67, 20.34 )
	Line1:setAlpha( 0.8 )
	Line1:setZRot( 90 )
	self:addElement( Line1 )
	self.Line1 = Line1
	
	local Line2 = CoD.AmmoWidget_BackLine.new( menu, controller )
	Line2:setLeftRight( false, false, -2.5, 66.5 )
	Line2:setTopBottom( false, false, 17.67, 20.34 )
	Line2:setAlpha( 0.8 )
	Line2:setZRot( 90 )
	self:addElement( Line2 )
	self.Line2 = Line2
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )

				Semi:completeAnimation()
				self.Semi:setLeftRight( false, false, -10.5, 10.5 )
				self.Semi:setTopBottom( false, false, -55.84, 17.67 )
				self.Semi:setAlpha( 0.6 )
				self.clipFinished( Semi, {} )

				Line1:completeAnimation()
				self.Line1:setLeftRight( false, false, -66.5, 2.5 )
				self.Line1:setTopBottom( false, false, 17.67, 20.34 )
				self.clipFinished( Line1, {} )

				Line2:completeAnimation()
				self.Line2:setLeftRight( false, false, -2.5, 66.5 )
				self.Line2:setTopBottom( false, false, 17.67, 20.34 )
				self.clipFinished( Line2, {} )
			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Semi:close()
		element.Line1:close()
		element.Line2:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
