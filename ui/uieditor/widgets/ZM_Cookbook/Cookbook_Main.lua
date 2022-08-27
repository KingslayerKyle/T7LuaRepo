-- 7fddd30c9860cd8133ebf208b290efac
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.ZM_Cookbook.Cookbook_FlowAnim_Top_Bg" )
require( "ui.uieditor.widgets.ZM_Cookbook.Cookbook_FlowAnim_Middle_Bg" )
require( "ui.uieditor.widgets.ZM_Cookbook.Cookbook_FlowAnim_Bottom_Bg" )

local PostLoadFunc = function ( self, controller, menu )
	self.AnimateAllPipes = function ( f2_arg0 )
		f2_arg0.CookbookFlowAnimTopBg:playClip( "Animate" )
		f2_arg0.CookbookFlowAnimMiddleBg:playClip( "Animate" )
		f2_arg0.CookbookFlowAnimBottomBg:playClip( "Animate" )
	end
	
end

CoD.Cookbook_Main = InheritFrom( LUI.UIElement )
CoD.Cookbook_Main.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.Cookbook_Main )
	self.id = "Cookbook_Main"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 96 )
	self:setTopBottom( true, false, 0, 399 )
	self.anyChildUsesUpdateState = true
	
	local CookbookFlowAnimTopBg = CoD.Cookbook_FlowAnim_Top_Bg.new( menu, controller )
	CookbookFlowAnimTopBg:setLeftRight( true, false, 0, 96 )
	CookbookFlowAnimTopBg:setTopBottom( true, false, 0.2, 153.2 )
	self:addElement( CookbookFlowAnimTopBg )
	self.CookbookFlowAnimTopBg = CookbookFlowAnimTopBg
	
	local CookbookFlowAnimMiddleBg = CoD.Cookbook_FlowAnim_Middle_Bg.new( menu, controller )
	CookbookFlowAnimMiddleBg:setLeftRight( true, false, 21.22, 96.22 )
	CookbookFlowAnimMiddleBg:setTopBottom( true, false, 122.72, 224.72 )
	self:addElement( CookbookFlowAnimMiddleBg )
	self.CookbookFlowAnimMiddleBg = CookbookFlowAnimMiddleBg
	
	local CookbookFlowAnimBottomBg = CoD.Cookbook_FlowAnim_Bottom_Bg.new( menu, controller )
	CookbookFlowAnimBottomBg:setLeftRight( true, false, 0.22, 96.22 )
	CookbookFlowAnimBottomBg:setTopBottom( true, false, 246, 399 )
	self:addElement( CookbookFlowAnimBottomBg )
	self.CookbookFlowAnimBottomBg = CookbookFlowAnimBottomBg
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.CookbookFlowAnimTopBg:close()
		element.CookbookFlowAnimMiddleBg:close()
		element.CookbookFlowAnimBottomBg:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

