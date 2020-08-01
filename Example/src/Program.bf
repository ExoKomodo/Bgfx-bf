using System;
using glfw_beef;

namespace Example
{
	public static class Program
	{
		public const int Width = 640;
		public const int Height = 480;

		public static int Main(String[] args)
		{

			if (!Glfw.Init())
			{
				return -1;
			}
			var window = Glfw.CreateWindow(
				Width,
				Height,
				"Hello",
				null,
				null
			);
			var platformData = Bgfx.PlatformData();
			platformData.nwh = Glfw.GetWin32Window(window);
			Bgfx.SetPlatformData(&platformData);

			var init = Bgfx.InitInfo();
			init.type = Bgfx.RendererType.OpenGL;
			init.resolution.width = Width;
			init.resolution.height = Height;
			init.resolution.reset = Bgfx.ResetFlags.Vsync;
			if (!Bgfx.Init(&init))
			{
				return -2;
			}
			Bgfx.ViewId viewId = 0;
			Bgfx.SetViewClear(
				viewId,
				Bgfx.ClearFlags.Color | Bgfx.ClearFlags.Depth,
				0x443355FF,
				1.0f,
				0
			);
			Bgfx.SetViewRect(
				viewId,
				0,
				0,
				Width,
				Height
			);

			while (!Glfw.WindowShouldClose(window))
			{
				Glfw.PollEvents();
				Bgfx.Touch(viewId);
				Bgfx.Frame();
			}
			Bgfx.Shutdown();
			Glfw.Terminate();

			return 0;
		}
	}
}